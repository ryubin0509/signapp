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
		return loginMapper.checkId(id);
		
	}
	
	public void insertId(Employee employee) {
		loginMapper.insertId(employee);
	}
	
}
