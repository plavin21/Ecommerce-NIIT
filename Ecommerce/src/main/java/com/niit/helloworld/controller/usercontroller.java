package com.niit.helloworld.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.cartDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.User;

@Controller
public class usercontroller {
	
	
	
		
		
			
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
				
				
				@RequestMapping("/sign")
				public ModelAndView sign(){
					ModelAndView mv1 = new ModelAndView("sign");
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							return mv1;
					
				}
				

				@RequestMapping("/log")
				public ModelAndView log(){
					
					
					ModelAndView mv1 = new ModelAndView("log");
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							return mv1;
				}
				
				
				
				@RequestMapping("/register")
				public ModelAndView adduser(@RequestParam("email") String mail,@RequestParam("mobile") int no,@RequestParam("name") String name,@RequestParam("address")
				String addr,@RequestParam("password") String pass) {
					System.out.println("in controller");
					System.out.println(mail+name+addr+pass);
					
					User u=new User();
				
					u.setEmail(mail);
					u.setMobno(no);
					u.setName(name);
					u.setAddress(addr);
					u.setPassword(pass);
					u.setRole("ROLE_USER");
					
					
					
					udao.save(u);
					
					ModelAndView mv1 = new ModelAndView("log");
					
					
				
					return mv1;
				}
				
				

}
