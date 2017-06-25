package com.bookStore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bookStore.model.User;
import com.bookStore.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;

	@RequestMapping("/userLogin.action")
	public String userLogin(String username, String password) {
		UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray());
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.login(token);
			token.clear();
		} catch (IncorrectCredentialsException ice) {
			ice.printStackTrace();
			return "redirect:/login.html";
		} catch (UnknownAccountException uae) {
			uae.printStackTrace();
			return "redirect:/login.html";
		}
		return "redirect:/";
	}

	@RequestMapping("/logout.action")
	public String logout() {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "redirect:/";
	}

	@RequestMapping("/admin/userManage.do")
	public ModelAndView userManage() {
		ModelAndView mov = new ModelAndView("/admin/userManage.jsp");
		List<User> readerList = userService.getAllReader();

		mov.addObject("readerList", readerList);
		return mov;
	}

	@RequestMapping("/admin/adminPswChangeSubmit.action")
	public ModelAndView adminPswChangeSubmit(String oldpsw, String newpsw) {
		ModelAndView mov = new ModelAndView();

		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		if (user.getPassWord().equals(oldpsw)) {
			if (newpsw != null) {
				userService.changePsw(user.getId(), newpsw);
				mov.setViewName("redirect:/logout.action");
			}
		} else {
			mov.addObject("message", "原密码错误");
			mov.setViewName("/admin/adminPswChange.jsp");
		}
		return mov;
	}

	@RequestMapping("/admin/createUserSubmit.action")
	public ModelAndView createUserSubmit(String username, String password, String realname, String phone) {
		ModelAndView mov = new ModelAndView("redirect:/admin/userManage.do");
		if (!StringUtils.isNumeric(phone)) {
			mov.addObject("message", "电话不合法");
			mov.setViewName("/admin/createUser.jsp");
			return mov;
		}

		User user = new User();
		user.setUserName(username);
		user.setPassWord(password);
		user.setPhone(phone);
		user.setAuthority(2);
		user.setRealname(realname);

		int resultNum = userService.createUser(user);
		if (resultNum < 1) {
			mov.addObject("message", "新增用户失败");
			mov.setViewName("/admin/createUser.jsp");
			return mov;
		}

		return mov;
	}
	
	@RequestMapping("/admin/editUser.do")
	public ModelAndView editUser(int id){
		ModelAndView mov = new ModelAndView("/admin/editUser.jsp");
		User user = userService.getUserById(id);
		mov.addObject("user",user);
		
		return mov;
	}
	
	@RequestMapping("/admin/editUserSubmit.action")
	public ModelAndView editUserSubmit(String username, String password, String realname, String phone,int id) {
		ModelAndView mov = new ModelAndView("redirect:/admin/userManage.do");
		if (!StringUtils.isNumeric(phone)) {
			mov.addObject("message", "电话不合法");
			mov.setViewName("/admin/editUser.jsp");
			return mov;
		}

		User user = new User();
		user.setUserName(username);
		user.setPassWord(password);
		user.setPhone(phone);
		user.setAuthority(2);
		user.setRealname(realname);
		user.setId(id);

		int resultNum = userService.updateUser(user);
		if (resultNum < 1) {
			mov.addObject("message", "修改读者失败");
			mov.setViewName("/admin/editUser.jsp");
			return mov;
		}

		return mov;
	}
	
	@RequestMapping("/admin/delUser.action")
	public ModelAndView delUser(int id){
		ModelAndView mov = new ModelAndView("redirect:/admin/userManage.do");
		
		int resultNum = userService.delUserById(id);
		if(resultNum<1){
			mov.addObject("message", "删除读者失败");
			return mov;
		}
		return mov;
	}
	@RequestMapping("/admin/banUser.action")
	public ModelAndView banUser(int id){
		ModelAndView mov = new ModelAndView("redirect:/admin/userManage.do");
		
		int resultNum = userService.banUserById(id);
		if(resultNum<1){
			mov.addObject("message", "禁用读者失败");
			return mov;
		}
		return mov;
	}
	
	@RequestMapping("/admin/launchUser.action")
	public ModelAndView launchUser(int id){
		ModelAndView mov = new ModelAndView("redirect:/admin/userManage.do");
		
		int resultNum = userService.launchUserById(id);
		if(resultNum<1){
			mov.addObject("message", "启动读者失败");
			return mov;
		}
		return mov;
	}
}
