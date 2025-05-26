package com.example.signapp.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.signapp.dto.Employee;
import com.example.signapp.service.LoginService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LoginRest {
	@Autowired LoginService loginService;
	
	@GetMapping("/checkId")
	public Map<String,Object> checkId(String id) {
		Map<String,Object> result = new HashMap<>();
		if(loginService.checkId(id) !=0) {
			result.put("status","fail");
			result.put("message", "ID가 중복되었습니다.");
		} else {
			result.put("status", "success");
			result.put("message", "ID 사용가능합니다.");
	}
		return result;
	}
	
	@PostMapping("/register")
	public String addLogin(Employee e ) {
		loginService.insertId(e);
		return "/login/login";
	}
	
}
