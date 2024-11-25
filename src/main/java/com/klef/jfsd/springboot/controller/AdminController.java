package com.klef.jfsd.springboot.controller;

import java.io.IOException;

import java.sql.Blob;
import java.sql.SQLException;

import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Product;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin-login")
	public ModelAndView adminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin-login");
		return mav;
	}
	
	@PostMapping("/check-admin-login")
	public ModelAndView checkAdminLogin(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Admin admin = service.checkAdminLogin(username, password);
		ModelAndView mav = new ModelAndView();
		if (admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			return adminHome();
		}
		
		mav.setViewName("admin-login-fail");
		mav.addObject("msg", "Admin Login Failed!");
		
		return mav;
	}
	
	@GetMapping("/admin-home")
	public ModelAndView adminHome() {
		ModelAndView mav = new ModelAndView("admin-home");
		long customerCount = service.customerCount();
		mav.addObject("customerCount", customerCount);
		return mav;
	}
	
	@GetMapping("/view-all-customers")
	public ModelAndView viewAllCustomers() {
		ModelAndView mav = new ModelAndView("view-all-customers");
		List<Customer> customers = service.viewAllCustomers();
		mav.addObject("customers", customers);
		mav.addObject("customerCount", service.customerCount());
		return mav;
	}
	
	@GetMapping("/admin-logout")
	public ModelAndView adminLogout() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin-login");
		mav.addObject("logout", true);
		return mav;
	}

	@GetMapping("/delete-customer")
	public ModelAndView deleteCustomer(@RequestParam(required = false) Integer id) {
		ModelAndView mav = new ModelAndView("delete-customer");
		
		if (id != null) {
			mav.addObject("msg", service.deleteCustomer(id));
		}
		
		List<Customer> customers = service.viewAllCustomers();
		mav.addObject("customers", customers);
		return mav;
	}
	
	@RequestMapping(value = "/view-customer-by-id", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewCustomerById(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("view-customer-by-id");
		
		if (request.getMethod().equals("POST")) {
			mav.addObject("customer", service.displayCustomerById(Integer.parseInt(request.getParameter("id"))));
		}
		
		List<Customer> customers = service.viewAllCustomers();
		mav.addObject("customers", customers);
		return mav;
	}
	
	@GetMapping("/add-product")
	public String addProductGet() {
		return "add-product";
	}
	
	@PostMapping("/add-product")
	public ModelAndView addProductPost(HttpServletRequest request, @RequestParam("pimg") MultipartFile imgFile) throws IOException, SQLException {
		String pname = request.getParameter("pname");
		double pcost = Double.parseDouble(request.getParameter("pcost"));
		String pdescription = request.getParameter("pdescription");
		
		byte[] imgBytes = imgFile.getBytes();
		Blob imgBlob = new SerialBlob(imgBytes);
		
		Product product = new Product();
		product.setName(pname);
		product.setCost(pcost);
		product.setDescription(pdescription);
		product.setImg(imgBlob);
		
		ModelAndView mav = new ModelAndView("product-success");
		mav.addObject("msg", service.addProduct(product));
		
		return mav;
	}
	
	@GetMapping("/view-all-products")
	public ModelAndView viewAllProducts() {
		ModelAndView mav = new ModelAndView("view-all-products");
		mav.addObject("products", service.viewAllProducts());
		return mav;
	}
	
	@GetMapping("/display-img")
	public ResponseEntity<byte[]> displayImg(@RequestParam int id) throws SQLException {
		Product product = service.displayProductById(id);
		byte[] imgBytes = product.getImg().getBytes(1, (int) product.getImg().length());
		
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imgBytes);		
	}
	
}
