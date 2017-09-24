package com.niit.helloworld.controller;




import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.DAOIMPL.categoryDAOImpl;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Supplier;
import com.niit.EcommerceBackEnd.models.User;

 
@Controller
public class HelloWorldController{
	@Autowired
	categoryDAO cdao;

	@Autowired
	userDAO udao;
	
	@Autowired
	supplierDAO sdao;
	
	String message ="Welcome to Spring MVC!";
	 
	
	
	@RequestMapping("/")
	public String index(){
		
			System.out.println("hi");
		return "index";
		
	}
	
	@RequestMapping("/log")
	public String log(){
		
		return "log";
		
	}
	
	@RequestMapping("/addC")
	public ModelAndView addcat(@RequestParam("cname") String name) {
		System.out.println("in controller");
		System.out.println(name);
		Category c=new Category();
	
		c.setC_title(name);
		
		cdao.saveProduct(c);
		
		ModelAndView mv1 = new ModelAndView("adding");
		
		
	
		return mv1;
	}
	
	
	@RequestMapping("/addS")
	public ModelAndView addsup(@RequestParam("sname") String name) {
		System.out.println("in controller");
		System.out.println(name);
		
		Supplier s=new Supplier();
	
		s.setS_name(name);
		
		
		
		sdao.saveSupplier(s);
		
		ModelAndView mv1 = new ModelAndView("adding");
		
		
	
		return mv1;
	}
	
	
	@RequestMapping("/login")
	public ModelAndView adduser(@RequestParam("email") String mail,@RequestParam("name") String name,@RequestParam("address")
	String addr,@RequestParam("password") String pass) {
		System.out.println("in controller");
		System.out.println(mail+name+addr+pass);
		
		User u=new User();
	
		u.setMail(mail);
		u.setUsername(name);
		u.setAddress(addr);
		u.setPassword(pass);
		
		
		
		udao.save(u);
		
		ModelAndView mv1 = new ModelAndView("log");
		
		
	
		return mv1;
	}
	
	
	
	
	@RequestMapping("/adding")
	public String adding(){
		
		
		
		return "adding";
		
		
	}
	
	
   
	
	@RequestMapping("/cart")
	public String cart(){
		
		return "cart";
		
	}
	@RequestMapping("/sign")
	public String sign(){
		
		return "sign";
		
	}
	
}
