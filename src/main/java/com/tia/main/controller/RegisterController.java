package com.tia.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbcp2.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tia.main.dao.MemberDAO;
import com.tia.main.dao.TestDAO;

@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TestDAO testDAO;
	
	@Autowired
	private MemberDAO memberService;
	
	
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
	
	@RequestMapping(value = "/memberSubmit.do", method = RequestMethod.POST)
	public HashMap<String, Object> memberRegisterProc(HttpServletRequest request, Model model) {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
//		memberService.insertMember(memInfo)
		
		
		
		
		return hashMap;
	}
	

}
