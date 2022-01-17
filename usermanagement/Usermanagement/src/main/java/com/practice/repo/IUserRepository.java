package com.practice.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.practice.entity.ResponseEntity;
import com.practice.entity.UserEntity;

@Repository
public interface IUserRepository extends JpaRepository<UserEntity, Integer>{
	
	
	@Query(nativeQuery = true, value = "call getUsers")
	public List<UserEntity> getUser();
	
	@Query(nativeQuery = true, value = "call getUserById(:Id)")
	public UserEntity getUserById(@Param("Id") Integer Id);
	
	@Query(nativeQuery = true, value = "call deleteUserById(:Id)")
	public UserEntity deleteUserById(@Param("Id") Integer Id);
	
	@Query(nativeQuery = true, value = "call createUserById(:firstname,:lastname)")
	public UserEntity createUserById(@Param("firstname") String firstname,@Param("lastname") String lastname);
	
	@Query(nativeQuery = true, value = "call updateUserById(:Id,:firstname,:lastname,@p_response)")
//	@Procedure(procedureName = "updateUserById", outputParameterName = "p_response")
	public ResponseEntity updateUserById(@Param("Id") Integer Id,@Param("firstname") String firstname,@Param("lastname") String lastname );
}
