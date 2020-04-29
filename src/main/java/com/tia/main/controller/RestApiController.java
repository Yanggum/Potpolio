package com.tia.main.controller;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.tags.Param;
import com.tia.main.dao.MemberDAO;
import com.tia.main.dao.TestDAO;

@RestController
public class RestApiController {
	
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TestDAO testDAO;
	
	@Autowired
	private MemberDAO memberService;	
	
	@RequestMapping("/randWord.do")
	public HashMap<String, Object> getRandWord(Model model) {
		
		HashMap<String, Object> map = new HashMap<>();		
		
		try {
			String test = testDAO.selectWord();			
			
			map.put("word", test);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
	
	@RequestMapping(value="/insertWord.do", method=RequestMethod.GET)
	public HashMap<String, Object> insertWord(@RequestParam(value="word") String word, Model model){
		
		HashMap<String, Object> map = new HashMap<>();
		HashMap<String, Object> paraMap = new HashMap<String, Object>();
		
		System.out.println(word);
		
		paraMap.put("WORD", word);
		
		try {
			testDAO.insertWord(paraMap);
			map.put("resultCode", "0000");			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("resultCode", "1000");						
		}
		
		
		return map;
	}
	
	
}
