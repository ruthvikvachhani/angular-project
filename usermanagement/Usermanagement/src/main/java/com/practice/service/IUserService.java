package com.practice.service;

import java.util.List;

import com.practice.entity.ResponseEntity;
import com.practice.entity.UserEntity;

public interface IUserService {

	public List<UserEntity> getUser();
	
	public UserEntity getUserById(Integer id);

	public UserEntity deleteUserById(Integer id);

	public UserEntity createUserById(UserEntity user);

	public ResponseEntity updateUserById(UserEntity user);
}
