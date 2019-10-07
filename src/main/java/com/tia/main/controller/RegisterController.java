package com.tia.main.controller;

import org.apache.commons.dbcp2.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tia.main.service.TestService;

@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TestService testDAO;
	
	@RequestMapping("/register.do")
	public String memberRegister(Model model) {
		try {
			String test = testDAO.selectNow();			
			model.addAttribute("serverTime", test);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "Register";
	}		
	
	@RequestMapping("/registerProc.do")
	public String memberRegisterProc(Model model) {
		
		
		
		return "Login";
	}
	

}
