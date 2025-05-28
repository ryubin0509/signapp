 	package com.example.signapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.signapp.dto.Employee;
import com.example.signapp.service.SignService;

@Controller
public class SignController {
	@Autowired SignService signService;
	
	// 사인 페이지
	@GetMapping("/signLevel3")
	public String signLevel3(@RequestParam("documentId")int documentId, @RequestParam("employeeId") String employeeId
							,@RequestParam("signOrder")int signOrder  ,Model model) {
		
		model.addAttribute("documentId", documentId);
		model.addAttribute("employeeId", employeeId);
		model.addAttribute("signOrder" , signOrder);
		
		return "signLevel3";
	}
	
	//문서 페이지
	@GetMapping("/docview")
	public String docView() {
		// 문서정보를 모델 담아서 렌더링..
		return "docview";
	}
	
}
