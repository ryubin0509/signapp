package com.example.signapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Employee;
import com.example.signapp.dto.Page;
import com.example.signapp.service.BoardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class Level2Controller {
	@Autowired BoardService boardService;
	
	@GetMapping("/level2/home")
	public String level2Home(HttpSession session, Model model) { 
	    Employee user = (Employee) session.getAttribute("loginUser");
	    model.addAttribute("loginUser", user);
	    
		return "level2/home";
	}
	
	@GetMapping("/level2/board/boardList")
	public String boardList(HttpSession session , Model model,
							@RequestParam(defaultValue = "1") int currentPage) {
		
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		Page p = new Page();
		p.setCurrentPage(currentPage);
		p.setRowPerPage(10); // 한 페이지 10개씩 보기
		p.setTotal(boardService.countDocument());
		p.setLastPage(p.calculateLastPage());
	
		int startRow = (p.getCurrentPage() -1) * p.getRowPerPage();
		List<Document> docList = boardService.getDocumentsByPage(startRow, p.getRowPerPage());
		
		model.addAttribute("page", p);
		model.addAttribute("docList", docList);
		model.addAttribute("loginUser", loginUser);
				
		return "level2/board/boardList";
	}
	
}
