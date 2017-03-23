package com.fangdong.business.mapper;

import com.fangdong.business.model.FdRegion;
import com.fangdong.business.model.FdRegionExample;
import com.fangdong.business.model.RegionVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdRegionMapper {
    int countByExample(FdRegionExample example);

    int deleteByExample(FdRegionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdRegion record);

    int insertSelective(FdRegion record);

    List<FdRegion> selectByExample(FdRegionExample example);
    
    List<RegionVo> selectAllRegion();
    
    List<FdRegion> selectAllParentsRegion();

    //获取所有第三级的地区
    List<FdRegion> selectAllErea();
    
    //根据城市id获取所有第二级的地区
    List<FdRegion> selectDistrictsByCityId(int cityId);
    
    //根据行政区id获取所有第三级的地区
    List<FdRegion> selectAreaByDistrictId(int districtId);

    FdRegion selectByPrimaryKey(Integer id);
    
    RegionVo selectRegionVoByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FdRegion record, @Param("example") FdRegionExample example);

    int updateByExample(@Param("record") FdRegion record, @Param("example") FdRegionExample example);

    int updateByPrimaryKeySelective(FdRegion record);

    int updateByPrimaryKey(FdRegion record);
    
    public List<FdRegion> selectChildren(String fatherId);
}