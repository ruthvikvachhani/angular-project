package com.practice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.practice.entity.ResponseEntity;
import com.practice.entity.UserEntity;
import com.practice.repo.IUserRepository;

@Service
public class UserService implements IUserService{

	@Autowired
	private IUserRepository userRepo;

	@Override
	public List<UserEntity> getUser() {
		List<UserEntity> findAll = userRepo.getUser();
		
		return findAll;
	}

	@Override
	public UserEntity getUserById(Integer id) {
		UserEntity findById = userRepo.getUserById(id);
		return findById;
	}

	@Override
	public UserEntity deleteUserById(Integer id) {
		return userRepo.deleteUserById(id);
	}

	@Override
	public UserEntity createUserById(UserEntity user) {
		return userRepo.createUserById(user.getFirstName(), user.getLastName());
	}

	@Override
	public ResponseEntity updateUserById(UserEntity user) {
		ResponseEntity response = userRepo.updateUserById(user.getUserId(),user.getFirstName(), user.getLastName());
		System.out.println(response.getResponse());
		
		return response;
	}
	
}
