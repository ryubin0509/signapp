package com.example.signapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.signapp.dto.Employee;


import jakarta.servlet.http.HttpSession;

@Controller
public class Level1Controller {

	@GetMapping("/level1/home")
	public String level1Home(HttpSession session, Model model) { 
	    Employee user = (Employee) session.getAttribute("loginUser");
	    model.addAttribute("loginUser", user);
	    
		return "level1/home";
	}
	
	@GetMapping("/level1/write")
	public String writeDocument(HttpSession session, Model model) {
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
		
		return "/level1/board/write";
	}
}
