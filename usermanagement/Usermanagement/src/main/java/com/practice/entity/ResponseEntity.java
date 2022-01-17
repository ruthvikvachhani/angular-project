package com.practice.entity;

import javax.persistence.Entity;

@Entity
public class ResponseEntity {

	
	private String p_response;

	
	public String getResponse() {
		return p_response;
	}

	public void setResponse(String response) {
		this.p_response = response;
	}
	
	
}
