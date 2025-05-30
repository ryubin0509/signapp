package com.example.signapp.dto;

import lombok.Data;

@Data
public class SignForm {
	private int signId;
	private int documentId;
	private String signerId; //  사인한 사람 Id
	private int signOrder; // 과장 2, 팀장3
	private String signaturePath; // 파일 위치
	private String signedTime; // 사인한 시간
	private String signImg;  // Base64 이미지 전송용 
	private String signStatus; // 사인 상태
}
