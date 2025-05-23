package com.example.signapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	// 회원페이지 이동
	@GetMapping("/signupForm")
	public String signupForm() {
		
		return "/login/signupForm";
	}
	
}
