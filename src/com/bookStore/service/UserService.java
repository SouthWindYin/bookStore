package com.bookStore.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bookStore.mapper.UserMapper;
import com.bookStore.model.User;
import com.bookStore.model.UserExample;

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
	
	public List<User> getAllReader(){
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andAuthorityGreaterThanOrEqualTo(2);
		return userMapper.selectByExample(example);
	}
	
	public void changePsw(int userId,String newpsw){
		User newUser = new User();
		newUser.setId(userId);
		newUser.setPassWord(newpsw);
		userMapper.updateByPrimaryKeySelective(newUser);
	}
	
	public int createUser(User user){
		return userMapper.insertSelective(user);
	}
	
	public User getUserById(int id){
		return userMapper.selectByPrimaryKey(id);
	}
	
	public int updateUser(User user){
		return userMapper.updateByPrimaryKeySelective(user);
	}
	
	public int delUserById(int id){
		return userMapper.deleteByPrimaryKey(id);
	}
	
	public int banUserById(int id){
		return userMapper.banUserById(id);
	}
	
	public int launchUserById(int id){
		return userMapper.launchUserById(id);
	}
}
