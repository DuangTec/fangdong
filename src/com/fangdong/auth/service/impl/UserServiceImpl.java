package com.fangdong.auth.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fangdong.auth.mapper.FdUserMapper;
import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.model.FdUserExample;
import com.fangdong.auth.model.FdUserExample.Criteria;
import com.fangdong.auth.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private FdUserMapper userMapper;

	@Override
	public Map<String, Object> userLogin(String username, String password) {
		//返回一个包含结果的map
		HashMap<String,Object> resultMap=new HashMap<String,Object>();
		resultMap.put("result", "fail");
		
		//增加查询条件
		FdUserExample userExample = new FdUserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		
		List<FdUser> userList = userMapper.selectByExample(userExample);
		
		if(userList.size()==1){
			resultMap.put("result", "success");
			resultMap.put("user", userList.get(0));
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> userSignUp(String username, String password) {
		HashMap<String,Object> resultMap = new HashMap<>();
		resultMap.put("result","fail");
		
		FdUser user = new FdUser();
		user.setUsername(username);
		user.setPassword(password);
		
		int row = 0;
		try {
			row = userMapper.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(row==1){
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}

	@Override
	public List<FdUser> getAllUser() {
		FdUserExample example = new FdUserExample();
		
		List<FdUser> userList = userMapper.selectByExample(example);
		return userList;
	}

	@Override
	public FdUser selectUserByUserName(String username) {
		FdUser user = userMapper.selectByUserName(username);
		
		return user;
	}

	@Override
	public boolean userExistCheck(String username) {
		FdUser user = userMapper.selectByUserName(username);
		if(user!=null)
			return true;
		return false;
	}

	
	@Override
	public int deleteUserById(int id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public FdUser getUserById(int id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public int createUser(FdUser newUser) {
		// TODO Auto-generated method stub
		return userMapper.insert(newUser);
	}

	@Override
	public int updateUser(FdUser User) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(User);
	}

	@Override
	public int userExistCheckReturnId(String username) {
		// TODO Auto-generated method stub
		FdUser newFU=userMapper.selectByUserName(username);	
		return newFU.getId();
	}

	

}
