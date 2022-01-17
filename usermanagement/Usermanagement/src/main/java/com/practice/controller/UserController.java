package com.practice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.practice.entity.ResponseEntity;
import com.practice.entity.UserEntity;
import com.practice.service.IUserService;

@RestController
public class UserController {
	
	@Autowired
	private IUserService userService;

	@CrossOrigin
	@GetMapping("/getusers")
	public List<UserEntity> findAllUser() {
		List<UserEntity> user = userService.getUser();
		return user;
	}
	
	@CrossOrigin
	@GetMapping("/getusers/{id}")
	public UserEntity findUser(@PathVariable Integer id) {
		UserEntity userById = userService.getUserById(id);
		return userById;
	}
	
	@CrossOrigin
	@DeleteMapping("/deleteuser/{id}")
	public UserEntity removeUser(@PathVariable Integer id) {
		UserEntity deleteUserById = userService.deleteUserById(id);
//		System.out.println(deleteUserById.getFirstName());
		return deleteUserById;
	}
	
	@CrossOrigin
	@PostMapping("/insertuser")
	public UserEntity createUser(@RequestBody UserEntity user) {
		return userService.createUserById(user);
	}
	
	@CrossOrigin
	@PutMapping("/updateuser")
	public ResponseEntity updateUser(@RequestBody UserEntity user) {
		
		ResponseEntity updateUserById = userService.updateUserById(user);
		
//		JSONO responseEntity = new ResponseEntity<String>(updateUserById,HttpStatus.OK);
//		System.out.println(responseEntity.getBody());
		System.out.println(updateUserById.getResponse());
		return updateUserById;
	}
}