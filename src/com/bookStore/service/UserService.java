package com.bookStore.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bookStore.mapper.UserMapper;
import com.bookStore.model.User;

@Service
public class UserService {
	@Resource
	private UserMapper userMapper;

	public User adminLogin(String username,String password){
		User admin = userMapper.selectAdminByUsername(username);
		if((admin!=null)&&(admin.getPassWord().equals(password))){
			return admin;
		} else{
			return null;
		}
	}
}
