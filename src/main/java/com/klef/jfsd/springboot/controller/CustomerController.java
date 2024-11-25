package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.service.CustomerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService service;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	
	@GetMapping("/customer-registration")
	public ModelAndView customerRegistration() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer-registration");
		return mav;
	}
	
	@GetMapping("/customer-login")
	public ModelAndView customerLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer-login");
		return mav;
	}
	
	@PostMapping("/register-customer")
	public ModelAndView registerCustomer(HttpServletRequest request) {
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String location = request.getParameter("location");
		
		Customer c = new Customer();
		c.setName(name);
		c.setGender(gender);
		c.setDob(dob);
		c.setEmail(email);
		c.setPassword(password);
		c.setLocation(location);
		
		String msg = service.customerRegistration(c);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer-reg-success");
		mav.addObject("msg", msg);
		return mav;
	}
	
	@PostMapping("/check-customer-login")
	public ModelAndView checkCustomerLogin(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = service.checkCustomerLogin(email, password);
		ModelAndView mav = new ModelAndView();
		if (customer != null) {
			HttpSession session = request.getSession();
			session.setAttribute("customer", customer);
			return customerHome();
		}
		
		mav.setViewName("customer-login");
		mav.addObject("msg", "Customer Login Failed!");
		
		return mav;
	}
	
	@GetMapping("/customer-home")
	public ModelAndView customerHome() {
		ModelAndView mav = new ModelAndView("customer-home");
		return mav;
	}
	
	@GetMapping("/customer-profile")
	public ModelAndView customerProfileGet() {
		ModelAndView mav = new ModelAndView("customer-profile");
		return mav;
	}
	
	@PostMapping("/customer-profile")
	public ModelAndView customerProfilePost(HttpServletRequest request) {
		Customer sessionCustomer = (Customer)request.getSession().getAttribute("customer");
		
		Customer customer = new Customer();
		customer.setId(sessionCustomer.getId());
		customer.setName(request.getParameter("name"));
		customer.setGender(request.getParameter("gender"));
		customer.setDob(request.getParameter("dob"));
		customer.setEmail(sessionCustomer.getEmail());
		customer.setPassword(request.getParameter("password"));
		customer.setLocation(request.getParameter("location"));
		
		String msg = service.updateCustomerProfile(customer);
		ModelAndView mav = new ModelAndView("customer-profile");
		mav.addObject("msg", msg);
		
		if (msg.equals("Customer Updated Successfully!")) {
			request.getSession().setAttribute("customer", customer);
		}
		
		return mav;
	}
	
	@GetMapping("/customer-logout")
	public ModelAndView customerLogout() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer-login");
		mav.addObject("logout", true);
		return mav;
	}
	
	@GetMapping("/update-customer-profile")
	public ModelAndView updateCustomerProfile() {
		ModelAndView mav = new ModelAndView("update-customer-profile");
		return mav;
	}

}
