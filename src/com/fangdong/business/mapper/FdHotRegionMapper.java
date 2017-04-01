package com.fangdong.business.mapper;

import com.fangdong.business.model.FdHotRegion;
import com.fangdong.business.model.FdHotRegionExample;
import com.fangdong.business.model.HotRegionVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdHotRegionMapper {
    int countByExample(FdHotRegionExample example);

    int deleteByExample(FdHotRegionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdHotRegion record);

    int insertSelective(FdHotRegion record);

    List<FdHotRegion> selectByExample(FdHotRegionExample example);
    
    List<HotRegionVo> selectAllHotRegion();
    
    HotRegionVo selectHotRegionById(int id);

    FdHotRegion selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FdHotRegion record, @Param("example") FdHotRegionExample example);

    int updateByExample(@Param("record") FdHotRegion record, @Param("example") FdHotRegionExample example);

    int updateByPrimaryKeySelective(FdHotRegion record);

    int updateByPrimaryKey(FdHotRegion record);
}