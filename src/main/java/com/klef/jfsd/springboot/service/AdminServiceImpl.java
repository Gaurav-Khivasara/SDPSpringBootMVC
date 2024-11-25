package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Product;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private CustomerRepository customerRepo;
	
	@Autowired
	private AdminRepository adminRepo;
	
	@Autowired
	private ProductRepository productRepo;

	@Override
	public List<Customer> viewAllCustomers() {
		return customerRepo.findAll();
	}

	@Override
	public Admin checkAdminLogin(String username, String password) {
		return adminRepo.checkAdminLogin(username, password);
	}
	
	@Override
	public long customerCount() {
		return customerRepo.count();
	}

	@Override
	public String deleteCustomer(int id) {
		if (!customerRepo.findById(id).isPresent()) {
			return "Customer with ID: " + id + " Not Found!";
		}
		
		customerRepo.deleteById(id);
		return "Customer with ID: " + id + " Deleted Successfully!";
	}

	@Override
	public Customer displayCustomerById(int id) {
		return customerRepo.findById(id).get();
	}

	@Override
	public String addProduct(Product product) {
		productRepo.save(product);
		return "Product Added Successfully!";
	}

	@Override
	public List<Product> viewAllProducts() {
		return productRepo.findAll();
	}

	@Override
	public Product displayProductById(int id) {
		return productRepo.findById(id).get();
	}

}
