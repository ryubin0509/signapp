package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
	int checkId(String id);  // ID 유효성 체크시 사용
	
}
