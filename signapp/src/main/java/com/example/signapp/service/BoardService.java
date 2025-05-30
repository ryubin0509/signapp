package com.example.signapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Employee;
import com.example.signapp.dto.SignForm;
import com.example.signapp.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class BoardService {
	@Autowired BoardMapper boardMapper;
	
	public int insertDocument(Document paramDocument,Employee employee) {
		return boardMapper.insertDocument(paramDocument, employee);
	}

	public int countDocument() {
		return boardMapper.countDocument();
		
	}

	public List<Document> getDocumentsByPage(int startRow, int rowPerPage) {
		return boardMapper.getDocumentsByPage(startRow, rowPerPage);
	}

	public Document getBoardOne(int documentId) {
		return boardMapper.getBoardOne(documentId);
		
	}

	public Document getDocumentById(int id) {
		return boardMapper.getDocumentById(id);
	}

	public int updateOne(Document paramDocument) {
		return boardMapper.updateOne(paramDocument);
		
	}

	public int deleteOne(int id) {
		return boardMapper.deleteOne(id);
		
	}

	public void updateStatus(SignForm signForm) {
		 boardMapper.updateStatus(signForm);
		
	}

	
	
	
	
}
