 	package com.example.signapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.signapp.dto.Employee;

@Controller
public class SignController {
	
	
	// 사인 페이지
	@GetMapping("/signLevel3")
	public String signLevel3() {
		return "signLevel3";
	}
	
	//문서 페이지
	@GetMapping("/docview")
	public String docView() {
		// 문서정보를 모델 담아서 렌더링..
		return "docview";
	}
	
}
