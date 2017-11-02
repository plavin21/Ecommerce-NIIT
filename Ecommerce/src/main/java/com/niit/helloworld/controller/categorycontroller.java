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
import com.niit.EcommerceBackEnd.models.Supplier;

@Controller
public class categorycontroller {
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
	
	
	@RequestMapping("/admin/adding")
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
	
	
	
	@RequestMapping("/admin/addC")
	public ModelAndView addcat(@RequestParam("cname") String name,@RequestParam("cimg") MultipartFile file) {
		System.out.println("in controller");
		System.out.println(name);
		Category c=new Category();
	
		c.setC_title(name);
		String img=file.getOriginalFilename();
		c.setImg(img);
		
		cdao.saveProduct(c);
		
		ModelAndView mv1 = new ModelAndView("redirect:/admin/adding");
		
		 
		return mv1;
	}
	
	@RequestMapping("/admin/categorylist")
	public ModelAndView updateC(){
		
		
		ModelAndView mv1 = new ModelAndView("updatingc");
		ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
		
		
		mv1.addObject("categorylis",ll);
		
	
				return mv1;
		
	}
	
	
	
	@RequestMapping("/admin/updatingc")
	public ModelAndView updatingc(){
		ModelAndView mv1 = new ModelAndView("redirect:/admin/categorylist");
		

				return mv1;
		
	}

	
	@RequestMapping("/admin/catdel")
	public ModelAndView categorylist(@RequestParam ("id") int catego){
		ModelAndView mv1 = new ModelAndView("redirect:/admin/categorylist");
		
		cdao.deleteCategory(catego);
		
         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
		
		
		mv1.addObject("categorylis",ll);
		
			return mv1;
		
	}
	
	@RequestMapping("/admin/cat")
	public ModelAndView updcate(@RequestParam ("id") int catego){
		
		ModelAndView mv1 = new ModelAndView("catupdate");
		Category l=new Category();
		l=cdao.getcatbyid(catego);
		mv1.addObject("category",l);
         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
		
		
		mv1.addObject("categorylis",ll);
		
				return mv1;
		
	}
	
	@RequestMapping("/admin/catupd")
	public ModelAndView categoryupd(@RequestParam ("id") int catego,RedirectAttributes redirectAttributes){
		ModelAndView mv1 = new ModelAndView("redirect:/admin/cat");
		redirectAttributes.addAttribute("id",catego);
		
		
			return mv1;
		
	} 
	
	
	
	@RequestMapping("/admin/updatecategory")
	public ModelAndView updatecategory(@RequestParam("catid") int id ,@RequestParam("catname") String name,
			@RequestParam("cimg") MultipartFile file) {
	System.out.println("in controller");
		System.out.println(name);
		Category c=new Category();
		c=cdao.getcatbyid(id);
		c.setC_id(id);
		c.setC_title(name);
		
		 System.out.println("In File : "+file.getOriginalFilename());
		 if(file.getOriginalFilename()!="")
		    	
		    {
		  
		    String img=file.getOriginalFilename();
	 	    c.setImg(img);
	 	   String filepath ="C:/Users/USER/workspace/Ecommerce/src/main/webapp/resources/img/"+file.getOriginalFilename();
			

			try {
				byte imagebyte[] = file.getBytes();
				BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(filepath));
				fos.write(imagebyte);
				fos.close();
				} catch (IOException e) {
				e.printStackTrace();
				} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
	    	
		    }
		   else
		    {
			    String cimg=c.getImg();
		    	c.setImg(cimg);
		   
		    }
		
		cdao.editcat(c);
		ModelAndView mv1 = new ModelAndView("redirect:/admin/categorylist");		
		
	
				return mv1;
			
		
	} 

}
