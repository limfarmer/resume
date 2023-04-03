package com.achu.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.achu.dao.ArtworkDao;
import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Image;
import com.achu.dto.Tag;
import com.achu.mapper.ArtworkMapper;
import com.achu.mapper.SearchMapper;

@Service
public class ArtworkServiceImp implements ArtworkService {
	@Autowired
	ArtworkDao artworkDao;
	
	@Autowired 
	ArtworkMapper artworkMapper;
	
	@Autowired
	SearchMapper searchMapper;
	
	
	@Override
	public List<Artwork> list(Criteria aCri) {
		return artworkDao.list(aCri);
	}
	@Override
	public List<Artwork> list() {
		return artworkDao.list(new Criteria());
	}
	@Override
	public List<Artwork> AchuRecommendArt() {
		return artworkDao.AchuRecommendArt();
	}
	@Override
	public List<Tag> topTag(){
		return artworkDao.topTag();
	}
	@Override
	public List<Artwork> topTagArt(String seqno){
		return artworkDao.topTagArt(seqno);
	}
	@Override
	public List<Artwork> rating(String userId){
		return artworkDao.Rating(userId);
	}
	@Override
	public List<Artwork> keywordList(Criteria aCri) {
		return artworkDao.keywordList(aCri);
	}
	@Override
	public Artwork artDetail(String seqno) {
		return artworkDao.artDetail(seqno);
	}
	@Override
	public List<Artwork> Restlist() {
		return searchMapper.getSearchList();
	}
	@Override
	public List<Artwork> searchList(String keyword) {
		return searchMapper.searchResult(keyword);
	}
	@Override
	public List<Artwork> searchTag(String tag) {
		return searchMapper.getTagArtList(tag);
	}
	@Override
	public int setImageLink(String seqno, String imageLink) {
		//System.out.println("서비스 이미지 링크:"+imageLink);
		return artworkMapper.setImageLink(seqno, imageLink);
	}
	@Override
	public String setImageFile(String seqno, MultipartFile item) {
		Image image = null;		
		System.out.println("item :" + item);
		long fileSize = item.getSize();
		System.out.println("업로드 파일사이즈 : " + fileSize);
		if(fileSize > 0) {
			String fileUploadPath = "C:\\Users\\lim\\Desktop\\banner_img\\main_banner_img\\";
			String fileName = item.getOriginalFilename();
			
			//방법1
			int idx = fileName.lastIndexOf(".");												
			String split_fileName = fileName.substring(0,idx);
			String split_extension = fileName.substring(idx+1);
			
			//방법2
			split_fileName = FilenameUtils.getBaseName(fileName);
			split_extension = FilenameUtils.getExtension(fileName);
			
			//중복된 파일을 업로드 하지 않기 위해 UID값 생성
			UUID uid = UUID.randomUUID();
			String saveFileName = split_fileName + "_" + uid + "." + split_extension;
			System.out.println("저장할 파일이름 :" + saveFileName);
			
			//업로드 파일 저장
			File file = new File(fileUploadPath+saveFileName);
			try {
				item.transferTo(file);
			} catch (Exception e) {				
				e.printStackTrace();
			}						
			
			image = new Image();
			image.setUploadName(fileName);
			image.setSaveName(saveFileName);
			image.setRoute(fileUploadPath);
			image.setFileSize(String.valueOf(fileSize));
			image.setFileType(item.getContentType());
			
			//이미지 파일타입 확인
			/*String fileType = item.getContentType();
			String type = fileType.substring(0, fileType.indexOf("/"));
			System.out.println("업로드 파일 타입 :" + type );						
			
			if(type.equals("image")) {																		
				image.setThumbnail(setThumbnail(file, saveFileName));
			}*/
		}
		
		return artworkMapper.setImageFile(seqno,image);
	}
	@Override
	public List<Artwork> getRatingList(String id) {
		return artworkMapper.getRatingList(id);
	}
	@Override
	public int modify(HashMap<String, String> key) {
		return artworkMapper.modify(key);
	}
	@Override
	public List<Artwork> myPageArtRating(String id) {
		return artworkMapper.myPageArtRating(id);
	}
	public List<Artwork> myPageArtWdate(String id) {
		return artworkMapper.myPageArtWdate(id);
	}
	@Override
	public List<Artwork> clickTag(String keyword) {
		return artworkMapper.clickTag(keyword);
	}
	
}
