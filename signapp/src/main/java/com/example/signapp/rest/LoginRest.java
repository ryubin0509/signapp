package com.example.signapp.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.signapp.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LoginRest {
	@Autowired LoginService loginService;
	
	@GetMapping("/checkId")
	public String checkId(String id) {
		if(loginService.checkId(id) !=0) {
			return "id가 중복되었습니다.";
		}
		
		return "id 사용가능합니다.";
	}
	
}
