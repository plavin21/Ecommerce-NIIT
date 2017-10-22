package com.niit.helloworld.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.cartDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.models.Cart;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Product;

@Controller
public class cartcontroller {

	
	
		
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
			
			
			
			

			   
			
			@RequestMapping("/cart")
			public ModelAndView cart(){
				
				ModelAndView mv1 = new ModelAndView("cart");
				
				
				ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
				
						
						mv1.addObject("catego",l);
						String Username=SecurityContextHolder.getContext().getAuthentication().getName();
						
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
			

			
			
			
			@RequestMapping("/catr")
			public ModelAndView catr(@RequestParam("quantity") int quantity,@RequestParam("id") int id ){
				
				ModelAndView mv1 = new ModelAndView("product");
				String name = SecurityContextHolder.getContext().getAuthentication().getName();
			    
				Product p=new Product();
				p=pdao.getProductById(id);
				int st=p.getStock();
				int stock=st-quantity;
				p.setStock(stock);
				pdao.editProduct(p);
			    
			    List<Cart> li=cardao.CheckExistence(id, name);
			    
			    
			    System.out.println("no of cart items :"+li.size()+":"+li);
			    
			    if(li.size()==0)
			    {
			    	
					Cart c=new Cart();
					Product ll=new Product();
					ll=pdao.getProductById(id);
					int pid=ll.getId();
					String pname=ll.getName();
					String pimg=ll.getImg();
					int price=ll.getPrice();
					
					Product pp=new Product();
					pp.setId(pid);
					pp.setName(pname);
					pp.setImg(pimg);
					pp.setPrice(price);
					
					c.setProduct(pp);
					
					
					c.setQuantity(quantity);
					c.setPrice(price);
					String username = SecurityContextHolder.getContext().getAuthentication().getName();
				    
				    c.setEmail(username);
				    cardao.savetocart(c);
			    }
			    
			    else
			    {
			    	Cart cart=li.get(0);
			    	int qu=cart.getQuantity();
			    	cart.setQuantity(qu+quantity);
			    	cardao.updateCart(cart);
			    	
			    	
			    	
			    }
				
			
				
			     

				Product lll=new Product();
				 lll=pdao.getProductById(id);
				
				
				mv1.addObject("produc",lll);	
				
				
				
				return mv1;
			}
			
			@RequestMapping("/catr1")
			public ModelAndView catr1(@RequestParam("id") int id ){
				
				ModelAndView mv1 = new ModelAndView("productlist");
				Cart c=new Cart();
				Product ll=new Product();
				ll=pdao.getProductById(id);
				int pid=ll.getId();
				String pname=ll.getName();
				String pimg=ll.getImg();
				int price=ll.getPrice();
				
				Product pp=new Product();
				pp.setId(pid);
				pp.setName(pname);
				pp.setImg(pimg);
				pp.setPrice(price);
				
				c.setProduct(pp);
				
				
				c.setQuantity(1);
				c.setPrice(price);
			
				String Username=SecurityContextHolder.getContext().getAuthentication().getName();
				
				c.setEmail(Username);
				cardao.savetocart(c);
			

				Product lll=new Product();
				 lll=pdao.getProductById(id);
				
				
				mv1.addObject("produc",lll);	
				
				
				
				return mv1;
			}
			
			
			
			@RequestMapping("delcart")
			public ModelAndView cartdelete(@RequestParam ("id") int carId){
				ModelAndView mv1 = new ModelAndView("cart");
				
				Cart c=cardao.getcartbyid(carId);
				Product p=pdao.getProductById(c.getProduct().getId());
				p.setStock(p.getStock()+c.getQuantity());
				System.out.println(p.getStock()+c.getQuantity());
				pdao.editProduct(p);
				
				
				cardao.deletefromcart(carId);
				
				String Username=SecurityContextHolder.getContext().getAuthentication().getName();
		         ArrayList<Cart> ll=(ArrayList<Cart>)cardao.getcartByuserId(Username);
				
				
				mv1.addObject("cartlis",ll);
				
				
				
				
					return mv1;
				
			} 
			
	
}
