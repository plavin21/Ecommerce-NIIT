package com.niit.helloworld.controller;

import java.util.ArrayList;

import org.hibernate.metamodel.relational.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
				
				@Autowired
				private MailSender sendmail;
				

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
				

				
				
				@RequestMapping("/user/checkadd")
				public ModelAndView checkadd(@RequestParam("name") String name,@RequestParam("mobile") long no,@RequestParam("address")
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
				
				@RequestMapping("/user/confirm")
				public ModelAndView confirm(){
					
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
				
				/*
				@RequestMapping("/user/confirm")
				public ModelAndView checkpay(){
					
					ModelAndView mv1 = new ModelAndView("redirect:/user/confirm1");
					
					
					return mv1;
					
				}*/
				@RequestMapping("/user/cancelord")
				public ModelAndView cancelorders(@RequestParam ("id") int id){
					
					odao.deletefromorder(id);
					String name=SecurityContextHolder.getContext().getAuthentication().getName();
					ArrayList<Cart> ll=(ArrayList<Cart>)cardao.getcartByuserId(name);
					ModelAndView mv1 = new ModelAndView("redirect:/user/cartpage");
					mv1.addObject("cartlis",ll);
					
					int total=0;
					for (Cart cart : ll) {
						
						int sum=cart.getPrice()*cart.getQuantity();
						total=total+sum;
					}	   
					
					
							mv1.addObject("sum",total);
							
							ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
							mv1.addObject("catego",l);	
					
							
							return mv1;
					
				}
				@RequestMapping("/user/thankyou")
				public ModelAndView ordercheck(){
					
					
					ModelAndView mv1 = new ModelAndView("thankyou");
					
							return mv1;
					
				}
				
				
				@RequestMapping("/user/checkord")
				public ModelAndView checkorder(){
					
					ModelAndView mv1 = new ModelAndView("redirect:/user/thankyou");
					String name=SecurityContextHolder.getContext().getAuthentication().getName();
					Orders oder=new Orders();
					oder=odao.getorderByuserId(name);
					String uname=oder.getName();
					
					
						
					SimpleMailMessage emaill = new SimpleMailMessage();
			        emaill.setTo("plavinpaul11@gmail.com");
			        emaill.setSubject("Order Confirmation");
			        
			        emaill.setText("hi "+uname+",\nYour Order is Placed Succesfully..");
			        // sends the e-mail
			        sendmail.send(emaill);
			        cardao.deletecartByuserId(name);
							
							return mv1;
					
				}
				
				

}
