package com.example.signapp.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.SignForm;
import com.example.signapp.mapper.BoardMapper;
import com.example.signapp.mapper.SignMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SignService {
	@Autowired SignMapper signMapper;
	@Autowired BoardMapper boardMapper;
	
	public boolean addSign(SignForm signForm) {
		// 0) signImg 파일이름을 생성
		String ext = ".png"; // data:image/png;Base64,xxxxxx....
		String filename = UUID.randomUUID().toString().replace("-", "")+ext;
		
		// 1) mapper 호출
		
		FileOutputStream fos = null;
		// 2) 이미지를 디코딩해서 원하는 위치에 저장
		try {
			fos = new FileOutputStream("c:\\project\\upload\\"+filename);
			// 파일을 만들 수 있는 비어있는 OutputStream에 signImg안에 이미지문자를 디코딩
			String signImg1 = signForm.getSignImg().split(",")[1];
			fos.write(Base64.getDecoder().decode(signImg1));
			
			signForm.setSignaturePath(filename);
			
			 signMapper.insertSign(signForm);
			
		} catch (FileNotFoundException e1) {
			log.error("파일생성 실패 @Transactional 록백");
			throw new RuntimeException();
		} catch (IOException e2) {
			log.error("파일 디코딩 실패  @Transactional 록백");
			throw new RuntimeException();
		}
		finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		 
		return true;
	}

	public int getBoardSignCount(int documentId) {  // 레벨 2 사인이미지 있는지 확인
		
		return signMapper.getBoardSignById(documentId);
		
	}

	public int getBoardSignCountLevel3(int documentId) { // 레벨 3 사인이미지 있는지 확인
		
		return signMapper.getBoardSignCountLevel3ById(documentId);
	}
	
	public String getBoardSign(int documentId) {  // 레벨 2 사인이미지 불러오기
		return signMapper.getBoardSign(documentId);
		
	}

	public String getBoardSignLevel3(int documentId) { // 레벨 3 이미지 불러오기 
		return signMapper.getBoardSignLevel3(documentId);
	}

	public int getSignCountByDocumentId(Document doc) { // 결제 상태 보여주기
		
		return signMapper.getSignCountByDocumentId(doc);
		
	}

	public void updateRejectSign(SignForm signForm) {
		signMapper.updateSignStatus(signForm);
		boardMapper.updateStatus(signForm);
		
	}

	public void insertRejectSign(SignForm signForm) {
		
		signMapper.insertRejectSign(signForm);
		
	}

}
