package com.example.signapp.controller;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.signapp.dto.Employee;
import com.example.signapp.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	// 회원페이지 이동
	@GetMapping("/signupForm")
	public String signupForm() {
		
		return "/login/signupForm";
	}
	
	// 로그인페이지 이동
	@GetMapping({"/login","/"})
	public String login() {
		return "/login/login";
	}
	
	// 로그인 값 조회
	@PostMapping("/loginForm")
	public String loginCheck(HttpSession session, Employee paramEmployee) {
		Employee loginUser = loginService.loginInformation(paramEmployee);
		
		if(loginUser != null) {
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			int level = loginUser.getLevel();
			if(level ==1) {
			 return "redirect:/level1/home";
			} else if(level == 2) {
			 return "redirect:/level2/home";
			} else if(level == 3) {
			 return "redirect:/level3/home";
			}
			else {
		    // 로그인 실패
			return "redirect:/login";
		}
			
	}
		return "redirect:/login";
}	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/login"; // 뷰로 보내는게 아닌 컨트롤러 요청에 redirect 를쓴다.
	
	}
}

	
	

