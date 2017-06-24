package com.bookStore.realm;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.bookStore.model.User;
import com.bookStore.service.UserService;


public class LoginShiroRealm extends AuthorizingRealm{
	
	@Resource
	private UserService userService;
	
	//获取授权信息
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("获取授权信息");
		//下面这句话还没懂
//		System.out.println(principals.fromRealm(getName()).iterator().next());
		User authUser= (User)(principals.fromRealm(getName()).iterator().next());
//		FdUser authUser = userService.selectUserByUserName(username);
		if((authUser!=null)&&(authUser.getAuthority()==1)){
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.addRole("admin");
			return info;
		}
		return null;
	}

	//获取认证信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
//		System.out.println("登陆认证");
		UsernamePasswordToken upToken =(UsernamePasswordToken) token;
		String username = upToken.getUsername();
		String password = String.valueOf(upToken.getPassword());
		User loginUser = userService.adminLogin(username, password);
		
		if(loginUser!=null){
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(loginUser,loginUser.getPassWord(),getName());
			return info;
		}
		return null;
	}
}
