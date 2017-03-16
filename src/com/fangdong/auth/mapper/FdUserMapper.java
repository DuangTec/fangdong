package com.fangdong.auth.mapper;

import com.fangdong.auth.model.FdUser;
import com.fangdong.auth.model.FdUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdUserMapper {
    int countByExample(FdUserExample example);

    int deleteByExample(FdUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdUser record);

    int insertSelective(FdUser record);

    List<FdUser> selectByExample(FdUserExample example);

    FdUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FdUser record, @Param("example") FdUserExample example);

    int updateByExample(@Param("record") FdUser record, @Param("example") FdUserExample example);

    int updateByPrimaryKeySelective(FdUser record);

    int updateByPrimaryKey(FdUser record);
    
    FdUser selectByUserName(String username);
}