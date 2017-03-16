package com.fangdong.auth.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.AuthPassport;
import com.fangdong.auth.model.FdUser;

public class SystemInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object arg2, Exception exc)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			//验证该请求是否需要“权限验证”
			AuthPassport authPassport =((HandlerMethod)handler).getMethodAnnotation(AuthPassport.class);
			if(authPassport != null){
				//从session中验证是否有该username，后续版本可以进行加密处理
				FdUser verifiedUser =(FdUser) req.getSession().getAttribute("verifiedUser");
				if(verifiedUser!=null){
						//	通过验证
					return true;
				} else{
					//session权限验证失败
						//跳转登录
					resp.sendRedirect("/login.jsp");
				}
				
			} else{
				//该请求不验证权限
					//跳转原页面
				return true;
			}
		}
		return true;
	}

}
