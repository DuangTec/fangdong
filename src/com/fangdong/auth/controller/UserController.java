package com.fangdong.auth.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
	
	//登录时提交
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
	
	//注册时提交
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
	
	//登出
	@RequestMapping("/logout.action")
	public String logout(HttpSession session){
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "redirect:/";
	}
	
	//用户注册的验证，检查用户名是否存在
	@ResponseBody
	@RequestMapping("/userValidationCheck.action")
	public String userValidationCheck(String username){
		if(!userService.userExistCheck(username))
			return "true";
		return "false";
	}
	
	//用户登录时的检查，检查用户是否存在
	@ResponseBody
	@RequestMapping("/usernameLoginCheck.action")
	public String usernameLoginCheck(String username){
		if(userService.userExistCheck(username))
			return "true";
		return "false";
	}
	//后台管理用户删除
	@RequestMapping("/admin/deleteUser.action")
	public ModelAndView deleteUser(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/admin/user_manage.do");
		try {
			userService.deleteUserById(id);
		} catch (Exception e) {
			mov.addObject("error","delete fail");
			e.printStackTrace();
		}
		
		return mov;
	}
	//后台管理用户修改
		@RequestMapping("/admin/editUser.do")
		public ModelAndView editUser(HttpServletRequest request){
			int id = Integer.parseInt(request.getParameter("id"));
			String type= request.getParameter("type");
			ModelAndView mov = new ModelAndView();
			mov.setViewName("redirect:/admin/user_manage_edit.jsp");
			if(type!=null&&type.equals("create"))
			{
				mov.addObject("type","create");
				return mov;
			}
			else
			{
				try {
					FdUser fu=userService.getUserById(id);
					mov.addObject("AditUser",fu);
				} catch (Exception e) {
					mov.addObject("error","edit fail");
					e.printStackTrace();
				}				
				return mov;
			}
			
		}
	
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping("/getUserPhone.action")
	public String getUserPhone(HttpServletRequest request){
		int ownerId = Integer.parseInt(request.getParameter("ownerId"));
		
		FdUser user =  userService.getUserById(ownerId);
//		String phone = user.getPhone();
		return user.getPhone();
	}

}
