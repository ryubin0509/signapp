package com.example.signapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Employee;
import com.example.signapp.dto.Page;
import com.example.signapp.service.BoardService;
import com.example.signapp.service.SignService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Level3Controller {
	@Autowired BoardService boardService;
	@Autowired SignService signService;
	
	@GetMapping("/level3/home")
	public String level2Home(HttpSession session, Model model) { 
	    Employee user = (Employee) session.getAttribute("loginUser");
	    model.addAttribute("loginUser", user);
	    
		return "level3/home";
	}
	
	@GetMapping("/level3/board/boardList")
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
		
		Map<Integer, Integer> signCountMap = new HashMap<>();
		
		for(Document doc : docList) {
			int count = signService.getSignCountByDocumentId(doc.getDocumentId());
			signCountMap.put(doc.getDocumentId(), count);
		}
		
		
		model.addAttribute("page", p);
		model.addAttribute("docList", docList);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("signCountMap", signCountMap);
		
		return "level3/board/boardList";
	}
	

	@GetMapping("/level3/board/boardOne") // 게시판 상세보기
	public String boardOne(HttpSession session, Model model, @RequestParam("id")int documentId	) {
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		Document doc = boardService.getBoardOne(documentId);
		
		int signL2 = signService.getBoardSignCount(documentId);
		if(signL2 == 1) {
			String file = signService.getBoardSign(documentId);
			model.addAttribute("file", file);
		}
		
		int signL3 = signService.getBoardSignCountLevel3(documentId);
		if(signL3 == 1) {
			String file2 = signService.getBoardSignLevel3(documentId);
			model.addAttribute("file2", file2);
			
		} 
		
		
		
		model.addAttribute("doc", doc);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("signL2", signL2);
		model.addAttribute("signL3", signL3);
		log.info("signL2값"+signL2 + "signL3값"+signL3 +"loginUser값"+loginUser.getLevel());
		return "/level3/board/boardOne";
		
	}
}
