package com.example.signapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.signapp.dto.Employee;
import com.example.signapp.mapper.LoginMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class LoginService {
	@Autowired LoginMapper loginMapper;
	
	public int checkId(String id) {
		return loginMapper.checkId(id);  //  id 유효성 체크
		
	}
	
	public void insertId(Employee employee) {
		loginMapper.insertId(employee); // 회원정보 생성
	}
	
	public Employee loginInformation(Employee employee) {
		return loginMapper.loginInformation(employee); 
	}
	
}
