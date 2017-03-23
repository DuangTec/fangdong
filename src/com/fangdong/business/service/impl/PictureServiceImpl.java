package com.fangdong.business.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fangdong.business.mapper.FdPictureMapper;
import com.fangdong.business.model.FdPicture;
import com.fangdong.business.service.PictureService;
@Service
public class PictureServiceImpl implements PictureService {

	@Resource
	private FdPictureMapper picMapper;
	
	@Override
	public boolean deletePicByHouseId(int houseId) {
		// TODO Auto-generated method stub
		boolean flag=true;
		int r=picMapper.deleteByHouseId(houseId);
		if(r==0){flag=false;}
		return flag;
	}

	@Override
	public void savePicByHouseId(String contextPath,List<MultipartFile> fileList, int houseId) throws Exception{
		for (int i = 0; i < fileList.size(); i++) {
			String fileName = fileList.get(i).getOriginalFilename();
			String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			String fileSrc = "\\img\\house-"+ houseId+ "-" + (i+1)+fileSuffix;
			// 存到本地
			File localFile = new File(contextPath+fileSrc);
			if (!localFile.exists())
				localFile.createNewFile();
			FileOutputStream fos;
			fos = new FileOutputStream(localFile);
			fos.write(fileList.get(i).getBytes());
			fos.close();
			//存图片到数据库
			FdPicture pic = new FdPicture();
			pic.setHouseId(houseId);
			pic.setPictureUrl(fileSrc);
			picMapper.insert(pic);
		}
	}

}
