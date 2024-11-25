package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Customer;

public interface CustomerService {
	
	String customerRegistration(Customer customer);
	Customer checkCustomerLogin(String email, String password);
	String updateCustomerProfile(Customer customer);

}
