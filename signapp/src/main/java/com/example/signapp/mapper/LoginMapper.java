package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Employee;

@Mapper
public interface LoginMapper {
	int checkId(String id);  // ID 유효성 체크시 사용
	void insertId(Employee employee);  // employee Id 추가
	Employee loginInformation(Employee employee); // employee Id 로그인정보 가져오기 
}
