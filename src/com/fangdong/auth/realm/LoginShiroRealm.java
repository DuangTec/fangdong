package com.fangdong.auth.realm;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.service.UserService;

public class LoginShiroRealm extends AuthorizingRealm{
	
	@Resource
	private UserService userService;
	
	//获取授权信息
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("获取授权信息");
		//下面这句话还没懂
		String username = (String)principals.fromRealm(getName()).iterator().next();
		FdUser authUser = userService.selectUserByUserName(username);
		if((authUser!=null)&&(authUser.getAuthority()==2)){
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.addRole("admin");
			return info;
		}
		return null;
	}

	//获取认证信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken =(UsernamePasswordToken) token;
		String username = upToken.getUsername();
		String password = String.valueOf(upToken.getPassword());
		FdUser loginUser = (FdUser) userService.userLogin(username, password).get("user");
		
		if(loginUser!=null){
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(loginUser.getUsername(),loginUser.getPassword(),getName());
			return info;
		}
		return null;
	}
}
