package com.niit.helloworld.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.cartDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Product;
import com.niit.EcommerceBackEnd.models.Supplier;

@Controller
public class suppliercontroller {
	 
	
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
		
		
		@RequestMapping("/admin")
		public ModelAndView adindex(){
			
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
		
		

		@RequestMapping("/adedit")
		public ModelAndView admin_addedit(){
			
			System.out.println("myke");
			ModelAndView mv1 = new ModelAndView("redirect:/admin/adedit");
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
		}
		
		@RequestMapping("/admin/adedit")
		public ModelAndView admin(){
			
			System.out.println("myke");
			ModelAndView mv1 = new ModelAndView("adedit");
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
		}
		@RequestMapping("/admin/addS")
		public ModelAndView addsup(@RequestParam("sname") String name/*,@RequestParam("sno") int no*/) {
			System.out.println("in controller");
			System.out.println(name);
			
			Supplier s=new Supplier();
		
			s.setS_name(name);
			/*s.setS_no(no);*/
			
			
			
			sdao.saveSupplier(s);
			
			ModelAndView mv1 = new ModelAndView("redirect:/admin/adding");
			
			return mv1;
		}
		
		
		@RequestMapping("/admin/options")
		public ModelAndView options(){
			ModelAndView mv1 = new ModelAndView("options");
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
		}
		
		
		
		@RequestMapping("/admin/suplist")
		public ModelAndView updateS(){
			
			ModelAndView mv1 = new ModelAndView("updatings");
			ArrayList<Supplier> ll=(ArrayList<Supplier>)sdao.getallsuppliers();
			mv1.addObject("supplierlis",ll);
			
			
					return mv1;
			
		}
		
		
		@RequestMapping("/admin/updatings")
		public ModelAndView updatings(){
			ModelAndView mv1 = new ModelAndView("redirect:/admin/suplist");
			
					return mv1;
			
		}
		
		
		@RequestMapping("/admin/supdel")
		public ModelAndView supplierlist(@RequestParam ("id") int supp){
			ModelAndView mv1 = new ModelAndView("redirect:/admin/suplist");
			
			sdao.deleteSupp(supp);
			
	       
				return mv1;
			
		} 
		
		@RequestMapping("/admin/sup")
		public ModelAndView updcat(@RequestParam ("id") int sup,RedirectAttributes redirectAttributes){
			
			
			ModelAndView mv1 = new ModelAndView("supupdate");
			Supplier s=new Supplier();
			
			s=sdao.getsuppbyid(sup);
			mv1.addObject("supplier",s);
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			return mv1;
			
		}
		
		@RequestMapping("/admin/supupd")
		public ModelAndView supupd(@RequestParam ("id") int sup,RedirectAttributes redirectAttributes){
			ModelAndView mv1 = new ModelAndView("redirect:/admin/sup");
			redirectAttributes.addAttribute("id", sup);
			
				return mv1;
			
		} 
		
		
		@RequestMapping("/admin/updatesupplier")
		public ModelAndView updatesupplier(@RequestParam("supid") int id ,@RequestParam("supname") String name) {
		
			System.out.println(name);
			Supplier s=new Supplier();
			s.setS_id(id);
			s.setS_name(name);
			
			sdao.editsupp(s);
			ModelAndView mv1 = new ModelAndView("redirect:/admin/suplist");		
			
			
			
							return mv1;
			
			
		} 
		
		

}