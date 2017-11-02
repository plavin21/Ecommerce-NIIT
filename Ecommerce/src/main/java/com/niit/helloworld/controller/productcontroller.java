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
public class productcontroller {
	
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
	
	
	
	@RequestMapping("/admin/addP")
	public ModelAndView addpro(@RequestParam("pname") String name,@RequestParam("cat") int cat,@RequestParam("supp") int supp,
			@RequestParam("desc") String desc,@RequestParam("price") int price,@RequestParam("stock") int stock,@RequestParam("img") MultipartFile file/*,@RequestParam("desc") String desc*/ ) {
		System.out.println("in controller");
		System.out.println(name+cat+supp+price+stock);
		Product p=new Product();
		
		String img=file.getOriginalFilename();
		p.setName(name);
		p.setDesc(desc);
		
		p.setPrice(price);
		p.setStock(stock);
		
		 p.setImg(img);
		/* p.setDesc(desc);*/
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
	    
	    /* String filepath = request.getSession().getServletContext().getRealPath("/") + "resources/product/" + file.getOriginalFilename();
		*/
	    String filepath ="C:/Users/USER/workspace/Ecommerce/src/main/webapp/resources/img/" + file.getOriginalFilename();
		
		System.out.println(filepath);
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
	    
		pdao.saveProduct1(p);
		ModelAndView mv1 = new ModelAndView("redirect:/admin/adding");
		 ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
		 System.out.println("printing");
		
				
				mv1.addObject("catego",l);
				ArrayList<Supplier> lll=(ArrayList<Supplier>)sdao.getallsuppliers();
				 System.out.println("printing");
				
						
						mv1.addObject("suppli",lll);
	
	
		return mv1;
	}
	
	@RequestMapping("/admin/prolist")
	public ModelAndView updateP(){
		
		
		ModelAndView mv1 = new ModelAndView("updating");
		
		ArrayList<Product> ll=(ArrayList<Product>)pdao.getAllProducts();
		mv1.addObject("productlis",ll);
		
				return mv1;
		
	}
	
	
	@RequestMapping("/admin/updating")
	public ModelAndView updating(){
		ModelAndView mv1 = new ModelAndView("redirect:/admin/prolist");
		

		
				return mv1;
		
	}
	@RequestMapping("/admin/prodel")
	public ModelAndView produlist(@RequestParam ("id") int productId){
		ModelAndView mv1 = new ModelAndView("redirect:/admin/prolist");
		
		pdao.deleteProduct(productId);
		
         
		return mv1;
		
	}
	
	@RequestMapping("/admin/prod")
	public ModelAndView updpro(@RequestParam ("id") int pro)
	{
		ModelAndView mv1 = new ModelAndView("proupdate");
		Product p=new Product();
		
		p=pdao.getProductById(pro);
		mv1.addObject("product",p);
		
         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
		
		/*System.out.println(pro+cat);*/
		mv1.addObject("categorylis",ll);
		
		ArrayList<Supplier> b=(ArrayList<Supplier>)sdao.getallsuppliers();
		
				
				mv1.addObject("supplier",b);
		
		
				return mv1;
		
	}
	
	@RequestMapping("/admin/proupd")
	public ModelAndView proupd(@RequestParam ("id") int pro,RedirectAttributes redirectAttributes/*,@RequestParam ("id2") int cat*/){
		ModelAndView mv1 = new ModelAndView("redirect:/admin/prod");
		redirectAttributes.addAttribute("id",pro);
		
			return mv1;
		
	}
	
	
	
	
	@RequestMapping("/admin/updateproduct")
	public ModelAndView updateproduct(@RequestParam("proid") int prid,@RequestParam("proname") String name,
			@RequestParam("description") String desc,@RequestParam("price") int price,
			@RequestParam("stock") int stock,@RequestParam("cat") int cat,@RequestParam("supp") int supp,
			@RequestParam("img") MultipartFile file) {
		
		
		ArrayList<Product> pp=new ArrayList<Product>();

		 
	
		Product p=pdao.getProductById(prid);
		
	
		p.setName(name);
		p.setDesc(desc);
		p.setPrice(price);
		p.setStock(stock);
	
		
		
		Category cc=new Category();
		cc=cdao.getcatbyid(cat);
		p.setCategory(cc);
		
		
	
		Supplier sup=new Supplier();
		sup=sdao.getsuppbyid(supp);
	    p.setSupplier(sup);
	    
	    //no image uplaod use previous image
	    System.out.println("In File : "+file.getOriginalFilename());
	    if(file.getOriginalFilename()!="")
	    	
	    {
	  
	    String img=file.getOriginalFilename();
 	    p.setImg(img);
 	   String filepath ="C:/Users/user/workspace/ecommerce/src/main/webapp/resources/img/"+file.getOriginalFilename();
		

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
		    String img=p.getImg();
	    	p.setImg(img);
	   
	    }
	    
	  
	    		pdao.editProduct(p);

	    		ModelAndView mv1 = new ModelAndView("redirect:/admin/prolist");
	
						return mv1;
				
		
		
	} 
	

	

}
