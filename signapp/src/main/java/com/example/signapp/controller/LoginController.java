package com.example.signapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.signapp.dto.Employee;
import com.example.signapp.service.LoginService;

@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	// 회원페이지 이동
	@GetMapping("/signupForm")
	public String signupForm() {
		
		return "/login/signupForm";
	}
	
	@PostMapping("/register")
	public String addLogin(Employee e ) {
		loginService.insertId(e);
		return "redirect:/login/login";
	}
	
}
