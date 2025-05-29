package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.SignForm;

@Mapper
public interface SignMapper {

	int  insertSign(SignForm signForm);

	int getBoardSignById(int documentId); // 레벨2 이미지 있는지 카운트
 
	String getBoardSign(int documentId); // 레벨2 이미지 파일 가져옴

	int getBoardSignCountLevel3ById(int documentId); // 레벨 3 이미지 있는지 카운트

	String getBoardSignLevel3(int documentId); // 레벨3 이미지 파일 가져옴

	int getSignCountByDocumentId(int documentId); // 결제상태 확인 카운트 

}
