package com.fangdong.business.mapper;

import com.fangdong.business.model.FdSubway;
import com.fangdong.business.model.FdSubwayExample;
import com.fangdong.business.model.SubwayRegionVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdSubwayMapper {
    int countByExample(FdSubwayExample example);

    int deleteByExample(FdSubwayExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdSubway record);

    int insertSelective(FdSubway record);

    List<FdSubway> selectByExample(FdSubwayExample example);
    
    List<SubwayRegionVo> selectAllSubway();

    FdSubway selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FdSubway record, @Param("example") FdSubwayExample example);

    int updateByExample(@Param("record") FdSubway record, @Param("example") FdSubwayExample example);

    int updateByPrimaryKeySelective(FdSubway record);

    int updateByPrimaryKey(FdSubway record);
}