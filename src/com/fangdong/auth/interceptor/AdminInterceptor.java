package com.fangdong.auth.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fangdong.auth.AdminPassport;
import com.fangdong.auth.model.FdUser;

/**
 * 
 * @author herui
 *
 */
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			//验证该请求是否需要“管理员验证”
			AdminPassport adminPassport =((HandlerMethod)handler).getMethodAnnotation(AdminPassport.class);
			if(adminPassport!=null){
				Subject currentUser = SecurityUtils.getSubject();
				if(currentUser.hasRole("admin")){
					return true;
				} else{
					return false;
				}				
			} else{
				return true;
			}
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
