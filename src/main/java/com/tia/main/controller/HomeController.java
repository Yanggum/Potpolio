package com.tia.main.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.dbcp2.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.jdbc.Statement;
import com.tia.main.service.TestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TestService testDAO;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping("/dbTest.do")
	public String dbTest(Model model) {
		Connection conn = null;
		java.sql.Statement st = null;
		
		try {
			conn = dataSource.getConnection();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select now() as now;");
			
			while(rs.next()) {
				model.addAttribute("serverTime", rs.getString("now"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null)
					st.close();
				
			}catch (Exception e) { 
				e.printStackTrace();				
			}
			
			try {
				if (st != null)
					conn.close();				
			}catch (Exception e) { 
				e.printStackTrace();				
			}			
		}
		return "home";
	}
	
	@RequestMapping("/dbTest2.do")
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
