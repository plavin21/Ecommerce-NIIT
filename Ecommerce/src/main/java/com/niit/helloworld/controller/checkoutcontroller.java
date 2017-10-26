package com.niit.helloworld.controller;

import java.util.ArrayList;

import org.hibernate.metamodel.relational.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
				public ModelAndView mycheckout(){
					
					System.out.println("myke");
					
					
					ModelAndView mv3 = new ModelAndView("redirect:/user/checkout");
					
							return mv3;
					
				}
				
				@RequestMapping("/user/checkout")
				public ModelAndView checkout(){
					
					
					
					
							String Username=SecurityContextHolder.getContext().getAuthentication().getName();
							
							ArrayList<Cart> ll=(ArrayList<Cart>)cardao.getcartByuserId(Username);
							
						
								ModelAndView mv1 = new ModelAndView("checkout");
								mv1.addObject("cartlis",ll);

								ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
								mv1.addObject("catego",l);
								return mv1;
						
					   
					
				}
				

				@RequestMapping("/checkadd")
				public ModelAndView addcheck(@RequestParam("name") String name,@RequestParam("mobile") int no,@RequestParam("address")
				String addr,@RequestParam("state") String state,@RequestParam("zip") int zip,RedirectAttributes redirectAttributes){
					
					System.out.println("myke");
					
					redirectAttributes.addAttribute("name", "name");
					redirectAttributes.addAttribute("mobile", "no");
					redirectAttributes.addAttribute("address", "addr");
					redirectAttributes.addAttribute("state", "state");
					redirectAttributes.addAttribute("zip", "zip");
					
					
					
					ModelAndView mv1 = new ModelAndView("redirect:/user/checkadd");
					
							return mv1;
					
				}
				
				
				@RequestMapping("/user/checkadd")
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
				public ModelAndView confirm(){
					
					System.out.println("myke");
					
					
					ModelAndView mv1 = new ModelAndView("redirect:/user/confirm");
					
							return mv1;
					
				}
				
				
				@RequestMapping("/user/confirm")
				public ModelAndView checkpay(){
					
					ModelAndView mv1 = new ModelAndView("confirm");
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
					mv1.addObject("catego",l);
					

					String Username=SecurityContextHolder.getContext().getAuthentication().getName();
			         Orders lll=(Orders)odao.getorderByuserId(Username);
			       
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
				
				/*@RequestMapping("/edconfirm")
				public ModelAndView checkconfirm(){
					
					ModelAndView mv1 = new ModelAndView("edconfirm");
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							
							return mv1;
					
				}*/
				
				
				@RequestMapping("/checkord")
				public ModelAndView ordercheck(){
					
					System.out.println("myke");
					
					
					ModelAndView mv1 = new ModelAndView("redirect:/user/checkord");
					
							return mv1;
					
				}
				
				
				@RequestMapping("/user/checkord")
				public ModelAndView checkorder(){
					
					ModelAndView mv1 = new ModelAndView("thankyou");
					String name=SecurityContextHolder.getContext().getAuthentication().getName();
					cardao.deletecartByuserId(name);
					
					
					
							
							return mv1;
					
				}
				
				

}
