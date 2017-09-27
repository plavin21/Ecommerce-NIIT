package com.niit.helloworld.controller;




import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.DAOIMPL.categoryDAOImpl;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Product;
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
	
	@Autowired
	ProductDAO pdao;
	
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
	
	@RequestMapping("/adding")
	public ModelAndView adding() {
		System.out.println("in controller");
		ModelAndView mv1 = new ModelAndView("adding");
		 ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		 System.out.println("printing");
		 for(Category cc:l)
			{
				System.out.println(cc);
			}
				
				mv1.addObject("catego",l);
		ArrayList<Supplier> ll=(ArrayList<Supplier>)sdao.getallsuppliers();
		 System.out.println("printing");
		 for(Supplier ss:ll)
			{
				System.out.println(ss);
			}
				
				mv1.addObject("suppli",ll);
		
		
		return mv1;
	}
	
	
	@RequestMapping("/addP")
	public ModelAndView addpro(@RequestParam("pname") String name,@RequestParam("cat") int cat,@RequestParam("supp") int supp,
			@RequestParam("price") int price,@RequestParam("stock") int stock) {
		System.out.println("in controller");
		System.out.println(name+cat+supp+price+stock);
		Product p=new Product();
		Category cc=new Category();
		
		p.setName(name);
		
		p.setPrice(price);
		p.setStock(stock);
		Category ll=new Category();
		ll=cdao.getcatbyid(cat);
	    int cati=ll.getC_id();
	    String catii=ll.getC_title();
	    System.out.println(cati+"  "+catii);
	    Category ccc=new Category();
	    ccc.setC_id(cati);
	    ccc.setC_title(catii);;
	    p.setCategory(ccc);
	    
	    Supplier ss=new Supplier();
		ss=sdao.getsuppbyid(supp);
	    int sup1=ss.getS_id();
	    String sup2=ss.getS_name();
	    
	    Supplier sss=new Supplier();
	    sss.setS_id(sup1);
	    sss.setS_name(sup2);;
	   
	    p.setSupplier(sss);
		pdao.saveProduct1(p);
		ModelAndView mv1 = new ModelAndView("adding");
		 ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		 System.out.println("printing");
		
				
				mv1.addObject("catego",l);
				ArrayList<Supplier> lll=(ArrayList<Supplier>)sdao.getallsuppliers();
				 System.out.println("printing");
				
						
						mv1.addObject("suppli",lll);
	
		
		
	
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
	
	
	
	
	
   
	
	@RequestMapping("/cart")
	public String cart(){
		
		return "cart";
		
	}
	
	@RequestMapping("/admin")
	public String admin(){
		
		return "admin";
		
	}
	@RequestMapping("/sign")
	public String sign(){
		
		return "sign";
		
	}
	
}
