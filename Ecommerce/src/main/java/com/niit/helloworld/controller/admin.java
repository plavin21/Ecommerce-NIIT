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

import com.niit.EcommerceBackEnd.DAO.ProductDAO;
import com.niit.EcommerceBackEnd.DAO.cartDAO;
import com.niit.EcommerceBackEnd.DAO.categoryDAO;
import com.niit.EcommerceBackEnd.DAO.supplierDAO;
import com.niit.EcommerceBackEnd.DAO.userDAO;
import com.niit.EcommerceBackEnd.models.Category;
import com.niit.EcommerceBackEnd.models.Product;
import com.niit.EcommerceBackEnd.models.Supplier;

@Controller
public class admin {
	 
	
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
		
		
		@RequestMapping("/admin/addC")
		public ModelAndView addcat(@RequestParam("cname") String name) {
			System.out.println("in controller");
			System.out.println(name);
			Category c=new Category();
		
			c.setC_title(name);
			
			cdao.saveProduct(c);
			
			ModelAndView mv1 = new ModelAndView("adding");
			
			
		
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
			
			ModelAndView mv1 = new ModelAndView("adding");
			
			
		
			return mv1;
		}
		
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
		
		
		@RequestMapping("/admin/addP")
		public ModelAndView addpro(@RequestParam("pname") String name,@RequestParam("cat") int cat,@RequestParam("supp") int supp,
				@RequestParam("price") int price,@RequestParam("stock") int stock,@RequestParam("img") MultipartFile file/*,@RequestParam("desc") String desc*/ ) {
			System.out.println("in controller");
			System.out.println(name+cat+supp+price+stock);
			Product p=new Product();
			
			String img=file.getOriginalFilename();
			p.setName(name);
			
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
			ModelAndView mv1 = new ModelAndView("adding");
			 ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			 System.out.println("printing");
			
					
					mv1.addObject("catego",l);
					ArrayList<Supplier> lll=(ArrayList<Supplier>)sdao.getallsuppliers();
					 System.out.println("printing");
					
							
							mv1.addObject("suppli",lll);
		
							/*MultipartFile image = p.getProductImage();
							if (image != null && !image.isEmpty()) {
								Path path = Paths.get("D:/review/eric"
												+ p.getId() + ".jpg");

								try {
									image.transferTo(new File(path.toString()));
								} catch (IllegalStateException e) {
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}*/
		
			return mv1;
		}

		@RequestMapping("/admin/options")
		public ModelAndView options(){
			ModelAndView mv1 = new ModelAndView("options");
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
		}
		
		@RequestMapping("/admin/updating")
		public ModelAndView updating(){
			ModelAndView mv1 = new ModelAndView("updating");
			
	ArrayList<Product> ll=(ArrayList<Product>)pdao.getAllProducts();
			
			
			mv1.addObject("productlis",ll);
			
			
			
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
		}
		
		
		
		@RequestMapping("/admin/updatingc")
		public ModelAndView updatingc(){
			ModelAndView mv1 = new ModelAndView("updatingc");
			
	ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			
			
			
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
		}
		
		
		@RequestMapping("/admin/updatings")
		public ModelAndView updatings(){
			ModelAndView mv1 = new ModelAndView("updatings");
			
	ArrayList<Supplier> ll=(ArrayList<Supplier>)sdao.getallsuppliers();
			
			
			mv1.addObject("supplierlis",ll);
			
			
			
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
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
		
		
		
		@RequestMapping("/admin/catdel")
		public ModelAndView categorylist(@RequestParam ("id") int catego){
			ModelAndView mv1 = new ModelAndView("updatingc");
			
			cdao.deleteCategory(catego);
			
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			
			
			
			
				return mv1;
			
		}
		
		@RequestMapping("/admin/catupd")
		public ModelAndView categoryupd(@RequestParam ("id") int catego){
			ModelAndView mv1 = new ModelAndView("catupdate");
			Category l=new Category();
			l=cdao.getcatbyid(catego);
			mv1.addObject("category",l);
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			
			
			
			
				return mv1;
			
		} 
		@RequestMapping("/admin/updatecategory")
		public ModelAndView updatecategory(@RequestParam("catid") int id ,@RequestParam("catname") String name) {
		System.out.println("in controller");
			System.out.println(name);
			Category c=new Category();
			c.setC_id(id);
			c.setC_title(name);
			
			cdao.editcat(c);
			ModelAndView mv1 = new ModelAndView("updatingc");		
	ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			

			mv1.addObject("categorylis",ll);
			
			
			
			ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
			
					
					mv1.addObject("catego",l);
					return mv1;
			
			
			
			
			
		} 
		
		
		
		@RequestMapping("/admin/supdel")
		public ModelAndView supplierlist(@RequestParam ("id") int supp){
			ModelAndView mv1 = new ModelAndView("updatings");
			
			sdao.deleteSupp(supp);
			
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			
			
			
			
				return mv1;
			
		} 
		@RequestMapping("/admin/supupd")
		public ModelAndView supupd(@RequestParam ("id") int sup){
			ModelAndView mv1 = new ModelAndView("supupdate");
			Supplier s=new Supplier();
			
			s=sdao.getsuppbyid(sup);
			mv1.addObject("supplier",s);
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			
			
			
			
				return mv1;
			
		} 
		
		
		@RequestMapping("/admin/updatesupplier")
		public ModelAndView updatesupplier(@RequestParam("supid") int id ,@RequestParam("supname") String name) {
		System.out.println("in controller");
			System.out.println(name);
			Supplier s=new Supplier();
			s.setS_id(id);
			s.setS_name(name);
			
			sdao.editsupp(s);
			ModelAndView mv1 = new ModelAndView("updatings");		
			
			
			ArrayList<Supplier> ll=(ArrayList<Supplier>)sdao.getallsuppliers();
					
					
					mv1.addObject("supplierlis",ll);
					
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							return mv1;
			
			
		} 
		
		
		@RequestMapping("/admin/prodel")
		public ModelAndView produlist(@RequestParam ("id") int productId){
			ModelAndView mv1 = new ModelAndView("updating");
			
			pdao.deleteProduct(productId);
			
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			
			mv1.addObject("categorylis",ll);
			
			
			
			
				return mv1;
			
		}
		
		@RequestMapping("/admin/proupd")
		public ModelAndView proupd(@RequestParam ("id") int pro/*,@RequestParam ("id2") int cat*/){
			ModelAndView mv1 = new ModelAndView("proupdate");
			System.out.println("hi");
			Product p=new Product();
			
			p=pdao.getProductById(pro);
			mv1.addObject("product",p);
			
			/*Category c=new Category();
			c=cdao.getcatbyid(cat);
			mv1.addObject("catego",c);
			
			String catii=c.getC_title();
			System.out.println(catii);
			*/
	         ArrayList<Category> ll=(ArrayList<Category>)cdao.getallcategories();
			
			/*System.out.println(pro+cat);*/
			mv1.addObject("categorylis",ll);
			
			
			
			
			 
			ArrayList<Supplier> b=(ArrayList<Supplier>)sdao.getallsuppliers();
			
					
					mv1.addObject("supplier",b);
			
			
			
				return mv1;
			
		} 
		
		
		@RequestMapping("/admin/updateproduct")
		public ModelAndView updateproduct(@RequestParam("proid") int id ,@RequestParam("proname") String name,@RequestParam("cat") int cat,
				@RequestParam("supp") int supp,
				@RequestParam("price") int price,@RequestParam("stock") int stock){
		System.out.println("in controller");
			System.out.println(name);
			Product p=new Product();
			p.setId(id);
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
			
			
			pdao.editProduct(p);
			ModelAndView mv1 = new ModelAndView("updating");
			
			
			
			
			
			ArrayList<Product> gp=(ArrayList<Product>)pdao.getAllProducts();
					
					
					mv1.addObject("productlis",gp);
					
					
					
					ArrayList<Category> l=(ArrayList<Category>)cdao.getallcategories();
					
							
							mv1.addObject("catego",l);
							return mv1;
					
			
			
		} 
		

		

}