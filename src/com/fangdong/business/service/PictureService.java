package com.fangdong.business.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface PictureService {

	public boolean deletePicByHouseId(int houseId);
	
	public void savePicByHouseId(String contextPath,List<MultipartFile> fileList,int houseId) throws Exception;
}
