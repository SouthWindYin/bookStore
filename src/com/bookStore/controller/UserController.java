package com.bookStore.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@RequestMapping("/userLogin.action")
	public String userLogin(String username,String password){				
		UsernamePasswordToken token= new UsernamePasswordToken(username,password.toCharArray());
		Subject currentUser = SecurityUtils.getSubject();
		try{
		 currentUser.login(token);
		 token.clear();
		}catch(IncorrectCredentialsException ice){
			ice.printStackTrace();
			return "redirect:/login.html";
		} catch(UnknownAccountException uae){
			uae.printStackTrace();
			return "redirect:/login.html";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout.action")
	public String logout(){
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "redirect:/";
	}
}
