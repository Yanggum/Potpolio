package com.tia.main.controller;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tia.main.dao.TestDAO;

@Controller
public class LoginController {
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TestDAO testDAO;

	
	
	
}
