package com.example.signapp.dto;

import lombok.Data;

@Data
public class Employee {
	private int employeeId; // 직원 등록 번호
	private String id;
	private String password;
	private String name;
	private int level;
	private String createdate;
}
