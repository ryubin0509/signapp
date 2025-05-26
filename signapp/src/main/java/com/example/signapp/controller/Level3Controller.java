package com.example.signapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.signapp.dto.Employee;

import jakarta.servlet.http.HttpSession;

@Controller
public class Level3Controller {
	
	@GetMapping("/level3/home")
	public String level2Home(HttpSession session, Model model) { 
	    Employee user = (Employee) session.getAttribute("loginUser");
	    model.addAttribute("loginUser", user);
	    
		return "level3/home";
	}
}
