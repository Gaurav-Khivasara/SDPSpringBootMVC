package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Product;

public interface AdminService {
	
	List<Customer> viewAllCustomers();
	Admin checkAdminLogin(String username, String password);
	long customerCount();
	String deleteCustomer(int id);
	Customer displayCustomerById(int id);
	String addProduct(Product product);
	List<Product> viewAllProducts();
	Product displayProductById(int id);
//	String adminRegistration(Admin admin);

}
