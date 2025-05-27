package com.example.signapp.dto;

import lombok.Data;

@Data
public class Page {
	
	private int currentPage;
	private int rowPerPage;
	private int total;
	private int lastPage;
	
	public int calculateLastPage() {
	    if (rowPerPage == 0) {
	        lastPage = 0;
	    } else {
	        lastPage = total / rowPerPage;
	        if (total % rowPerPage != 0) {
	            lastPage += 1;
	        }
	        
	    }
	    return lastPage;
	}

}
