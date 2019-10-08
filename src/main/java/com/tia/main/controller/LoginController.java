package com.tia.main.controller;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tia.main.dao.TestDAO;

@Controller
public class LoginController {
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TestDAO testDAO;

	@RequestMapping("/login.do")
	public String dbTest2(Model model) {
		try {
			String test = testDAO.selectNow();			
			model.addAttribute("serverTime", test);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "Login";
	}	
	
}
