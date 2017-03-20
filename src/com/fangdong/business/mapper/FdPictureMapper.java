package com.fangdong.business.mapper;

import com.fangdong.business.model.FdPicture;
import com.fangdong.business.model.FdPictureExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FdPictureMapper {
    int countByExample(FdPictureExample example);

    int deleteByExample(FdPictureExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FdPicture record);

    int insertSelective(FdPicture record);

    List<FdPicture> selectByExample(FdPictureExample example);
    
    List<FdPicture> selectByHouseId(Integer id);

    FdPicture selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FdPicture record, @Param("example") FdPictureExample example);

    int updateByExample(@Param("record") FdPicture record, @Param("example") FdPictureExample example);

    int updateByPrimaryKeySelective(FdPicture record);

    int updateByPrimaryKey(FdPicture record);
}