package com.fangdong.business.mapper;

import com.fangdong.business.model.FdSubwayRegion;
import com.fangdong.business.model.FdSubwayRegionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdSubwayRegionMapper {
    int countByExample(FdSubwayRegionExample example);

    int deleteByExample(FdSubwayRegionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdSubwayRegion record);

    int insertSelective(FdSubwayRegion record);

    List<FdSubwayRegion> selectByExample(FdSubwayRegionExample example);

    FdSubwayRegion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FdSubwayRegion record, @Param("example") FdSubwayRegionExample example);

    int updateByExample(@Param("record") FdSubwayRegion record, @Param("example") FdSubwayRegionExample example);

    int updateByPrimaryKeySelective(FdSubwayRegion record);

    int updateByPrimaryKey(FdSubwayRegion record);
}