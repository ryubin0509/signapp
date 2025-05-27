package com.example.signapp.dto;

import lombok.Data;

@Data
public class Document {
	
	private int documentId;
	private String title;
	private String content; 
	private String uploaderId;
	private String uploadedTime;
	private String uploaderName;
}
