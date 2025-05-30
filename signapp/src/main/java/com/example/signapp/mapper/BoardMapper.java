package com.example.signapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Employee;
import com.example.signapp.dto.SignForm;

@Mapper
public interface BoardMapper {
	//  문서작성 쿼리
	int insertDocument(@Param("doc") Document doc, @Param("emp") Employee emp);

	// 전체문서개수확인
	int countDocument();
	
	// 문서페이징 
	List<Document> getDocumentsByPage(@Param("startRow") int startRow,@Param("rowPerPage") int rowPerPage);
	
	// 문서 상세정보 보기
	Document getBoardOne(int documentId);

	// Id 로 문서정보 불러오기
	Document getDocumentById(int id);
	
	// 게시판 업데이트 하기
	int updateOne(Document paramDocument);

	// 게시판 삭제하기
	int deleteOne(int id);

	// 게시판 업데이트 하기
	int updateStatus(SignForm signForm);
}
