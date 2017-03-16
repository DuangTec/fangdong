package com.fangdong.auth.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.security.SecurityUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.service.UserService;

@Controller
public class UserController{
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/userLogin.action")
	public String userLogin(HttpServletRequest request,HttpSession session){
		String username = request.getParameter("username_login");
		String password = request.getParameter("password_login");
				
		UsernamePasswordToken token= new UsernamePasswordToken(username,password.toCharArray());
		Subject currentUser = SecurityUtils.getSubject();
		try{
		 currentUser.login(token);
		 token.clear();
		}catch(IncorrectCredentialsException ice){
			ice.printStackTrace();
			return "redirect:/login.jsp";
		} catch(UnknownAccountException uae){
			uae.printStackTrace();
			return "redirect:/login.jsp";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/userSignUp.action")
	public ModelAndView userSignUp(HttpServletRequest request){
		String username = request.getParameter("username_reg");
		String password = request.getParameter("password_reg");
		
		ModelAndView mov = new ModelAndView();
		
		HashMap<String,Object> map =(HashMap<String, Object>) userService.userSignUp(username, password);
		if(map.get("result").equals("success")){
			mov.setViewName("redirect:/login.jsp");
		}
		return mov;
	}
	

	@RequestMapping("/pay")
	public ModelAndView pay(){
		ModelAndView mov = new ModelAndView();
		mov.setViewName("success.jsp");
		mov.addObject("loginMes","pass the authentication");
		return mov;
	}
	
	@RequestMapping("/logout.action")
	public String logout(HttpSession session){
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping("/userValidationCheck.action")
	public String userValidationCheck(String username){
		if(!userService.userExistCheck(username))
			return "true";
		return "false";
	}
	
	@ResponseBody
	@RequestMapping("/usernameLoginCheck.action")
	public String usernameLoginCheck(String username){
		if(userService.userExistCheck(username))
			return "true";
		return "false";
	}
}
