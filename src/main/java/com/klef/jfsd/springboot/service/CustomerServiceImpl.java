package com.klef.jfsd.springboot.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerRepository repository;

	@Override
	public String customerRegistration(Customer customer) {
		repository.save(customer);
		return "Customer Registered Successfully!";
	}

	@Override
	public Customer checkCustomerLogin(String email, String password) {
		return repository.checkCustomerLogin(email, password);
	}

	@Override
	public String updateCustomerProfile(Customer customer) {
		Optional<Customer> c = repository.findById(customer.getId());
		
		if (!c.isPresent()) {
			return "Invalid Customer Data!";
		}
		
		Customer newCustomer = c.get();
		newCustomer.setName(customer.getName());
		newCustomer.setGender(customer.getGender());
		newCustomer.setDob(customer.getDob());
		newCustomer.setPassword(customer.getPassword());
		newCustomer.setLocation(customer.getLocation());
		
		repository.save(newCustomer);
		
		return "Customer Updated Successfully!";
	}

}
