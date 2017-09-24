package home.niit.EcommerceBackEnd.DAO;

import java.util.List;

import home.niit.EcommerceBackEnd.models.Product;


public interface ProductDAO {
	void saveProduct();
	List<Product> getAllProducts();
	Product getProductById();

}
