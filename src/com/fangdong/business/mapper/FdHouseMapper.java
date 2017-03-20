package com.fangdong.business.mapper;

import com.fangdong.business.model.FdHouse;
import com.fangdong.business.model.FdHouseExample;
import com.fangdong.business.model.HouseVo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdHouseMapper {
    int countByExample(FdHouseExample example);

    int deleteByExample(FdHouseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdHouse record);

    int insertSelective(FdHouse record);

    List<FdHouse> selectByExample(FdHouseExample example);

    FdHouse selectByPrimaryKey(Integer id);
    
    //模糊查询的dao层接口
    List<HouseVo> selectByKey(String key);
    
    //猜你喜欢的dao层接口
    List<HouseVo> selectGuessYouLike(String district);

    int updateByExampleSelective(@Param("record") FdHouse record, @Param("example") FdHouseExample example);

    int updateByExample(@Param("record") FdHouse record, @Param("example") FdHouseExample example);

    int updateByPrimaryKeySelective(FdHouse record);

    int updateByPrimaryKey(FdHouse record);
    
    List<HouseVo> selectAllHouseVo();

    List<HouseVo> selectTopHouseVo(@Param("top")int top,@Param("regionId")int regionId);
}