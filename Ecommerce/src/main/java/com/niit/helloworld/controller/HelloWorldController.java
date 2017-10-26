package com.niit.helloworld.controller;




import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.SysexMessage;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.cartDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.DAOIMPL.categoryDAOImpl;
import com.niit.EcommerceBackEnd.models.Cart;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Product;
import com.niit.EcommerceBackEnd.models.Supplier;
import com.niit.EcommerceBackEnd.models.User;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

 
@Controller
public class HelloWorldController{
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
	
	String message ="Welcome to Spring MVC!";
	 
	
	
	@RequestMapping("/")
	public ModelAndView index(){
		
		System.out.println("in controller");
		ModelAndView mv1 = new ModelAndView("index");
		 ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		 System.out.println("printing");
		 for(Category cc:l)
			{
				System.out.println(cc);
			}
				
				mv1.addObject("catego",l);
		return mv1;
	}
	
	@RequestMapping("/user")
	public ModelAndView userhome(){
		
		System.out.println("in controller");
		ModelAndView mv1 = new ModelAndView("index");
		 ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		 System.out.println("printing");
		 for(Category cc:l)
			{
				System.out.println(cc);
			}
				
				mv1.addObject("catego",l);
		return mv1;
	}
	
	
	
	@RequestMapping("/catpro")
	public ModelAndView cart(@RequestParam ("id") int catego){
		
		System.out.println("myke");
		ModelAndView mv1 = new ModelAndView("productlist");
		
		
		ArrayList<Product> ll=(ArrayList<Product>)pdao.getProdBycatId(catego);
		/*ArrayList<Product> ll=(ArrayList<Product>)pdao.getProdBycatId(catego);*/
		
		mv1.addObject("productli",ll);
		
		
		ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		
				
				mv1.addObject("catego",l);
		
	return mv1;
		
	}
	
	@RequestMapping("/user/catpro")
	public ModelAndView userproductlist(@RequestParam ("id") int catego,RedirectAttributes redirectAttributes){
		ModelAndView mv1 = new ModelAndView("redirect:/catpro");
		redirectAttributes.addAttribute("id", catego);
		
				return mv1;
		
	} 

	
	@RequestMapping("/user/productlist")
	public ModelAndView useproducts(@RequestParam ("id") int catego,RedirectAttributes redirectAttributes){
		
		System.out.println("myke");
		
		redirectAttributes.addAttribute("id", catego);
		
		
		ModelAndView mv1 = new ModelAndView("redirect:/productlist");
		
				return mv1;
		
	}
	
	
	@RequestMapping("/productlist")
	public ModelAndView products(@RequestParam ("id") int catego){
		ModelAndView mv1 = new ModelAndView("productlist");
		
		ArrayList<Product> ll=(ArrayList<Product>)pdao.getProdBycatId(catego);
		
		
		mv1.addObject("productli",ll);
		
		
		
		ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		
				
				mv1.addObject("catego",l);
				return mv1;
		
	} 
	
	
	
	@RequestMapping("/prolis")
	public ModelAndView productdetail(@RequestParam ("id") int prod,@RequestParam("c_id") int catego){
		ModelAndView mv1 = new ModelAndView("product");
		Product ll=new Product();
		 ll=pdao.getProductById(prod);
		
		
		mv1.addObject("produc",ll);
		
		ArrayList<Product> lll=(ArrayList<Product>)pdao.getProdBycatId(catego);
		mv1.addObject("productli",lll);
		
		
		ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		mv1.addObject("catego",l);
				return mv1;
		
	} 
	
	
	@RequestMapping("/user/prolis")
	public ModelAndView prodlist(@RequestParam ("id") int prod,@RequestParam("c_id") int catego,RedirectAttributes redirectAttributes){
		
		System.out.println("myke");
		
		redirectAttributes.addAttribute("id", prod);
		redirectAttributes.addAttribute("c_id", catego);
		
		
		ModelAndView mv1 = new ModelAndView("redirect:/prolis");
		
				return mv1;
		
	}
	
	
	@RequestMapping("/invalid")
	public ModelAndView invalid(){
		ModelAndView mv1 = new ModelAndView("error");
	return mv1;
	
	}
	
	@RequestMapping("/Auth")
	public ModelAndView auth(){
		ModelAndView mv1 = new ModelAndView("error2");
	return mv1;
	
	}
}
