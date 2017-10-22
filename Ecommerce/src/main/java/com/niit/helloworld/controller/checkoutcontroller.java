package com.niit.helloworld.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.cartDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.orderDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.models.Cart;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Orders;

@Controller
public class checkoutcontroller {
	
		
				@Autowired
				categoryDAO cdao;

				@Autowired
				userDAO udao;
				
				@Autowired
				supplierDAO sdao;
				
				@Autowired
				ProductDAO pdao;
				
				@Autowired
				cartDAO cardao;
				
				@Autowired
				orderDAO odao;
				
				
				@RequestMapping("/checkout")
				public ModelAndView checkout(){
					
					ModelAndView mv1 = new ModelAndView("checkout");
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							String Username=SecurityContextHolder.getContext().getAuthentication().getName();
							
							ArrayList<Cart> ll=(ArrayList<Cart>)cardao.getcartByuserId(Username);
							
					   
							

							mv1.addObject("cartlis",ll);
							return mv1;
					
				}
				
				
				
				@RequestMapping("/checkadd")
				public ModelAndView checkadd(@RequestParam("name") String name,@RequestParam("mobile") int no,@RequestParam("address")
				String addr,@RequestParam("state") String state,@RequestParam("zip") int zip){
					
					ModelAndView mv1 = new ModelAndView("payment");
					
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							Orders order=new Orders();
							order.setName(name);
							order.setMobno(no);
							order.setAddress(addr);
							String Username=SecurityContextHolder.getContext().getAuthentication().getName();
							order.setEmail(Username);
							order.setState(state);
							order.setZip(zip);
							
						odao.saveOrder(order);
					
				
							
					return mv1;
				}
				
				@RequestMapping("/confirm")
				public ModelAndView checkpay(){
					
					ModelAndView mv1 = new ModelAndView("confirm");
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
					mv1.addObject("catego",l);
					

					String Username=SecurityContextHolder.getContext().getAuthentication().getName();
			         ArrayList<Orders> lll=(ArrayList<Orders>)odao.getorderByuserId(Username);
			         mv1.addObject("orders",lll);
			         
			         
			         
			         ArrayList<Cart> ll=(ArrayList<Cart>)cardao.getcartByuserId(Username);
						mv1.addObject("cartlis",ll);
						int total=0;
				for (Cart cart : ll) {
					
					int sum=cart.getPrice()*cart.getQuantity();
					total=total+sum;
				}	   
				
				
						mv1.addObject("sum",total);

						
						return mv1;
					
				}
				
				@RequestMapping("/edconfirm")
				public ModelAndView checkconfirm(){
					
					ModelAndView mv1 = new ModelAndView("edconfirm");
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							
							return mv1;
					
				}
				
				@RequestMapping("/checkord")
				public ModelAndView checkorder(@RequestParam("id") int id){
					
					ModelAndView mv1 = new ModelAndView("thankyou");
					String name=SecurityContextHolder.getContext().getAuthentication().getName();
					cardao.deletecartByuserId(name);
					odao.deletefromorder(id);
					
					
							
							return mv1;
					
				}
				
				

}