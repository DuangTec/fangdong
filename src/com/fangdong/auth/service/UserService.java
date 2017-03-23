package com.fangdong.auth.service;

import java.util.List;
import java.util.Map;

import com.fangdong.auth.model.FdUser;

public interface UserService {
	public Map<String,Object> userLogin(String username,String password);
	public Map<String,Object> userSignUp(String username,String password);
	public List<FdUser> getAllUser();
	public FdUser getUserById(int id);
	public FdUser selectUserByUserName(String username);
	public boolean userExistCheck(String username);
	public int userExistCheckReturnId(String username);
	public int deleteUserById(int id);
	public int createUser(FdUser newUser);
	public int updateUser(FdUser User);
}
