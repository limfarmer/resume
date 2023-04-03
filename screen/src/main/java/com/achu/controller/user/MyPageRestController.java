package com.achu.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.achu.dto.Artwork;
import com.achu.service.ArtworkService;

@RestController
@RequestMapping("/MyPageDetail/")
public class MyPageRestController {
	@Autowired
	ArtworkService artworkService;
	
	@GetMapping(value="checkArt/{id}",
			    produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			    			MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<Artwork>> checkArt(@PathVariable("id") String id){
		return new ResponseEntity<>(artworkService.myPageArtRating(id),HttpStatus.OK);
		
	}
	@GetMapping(value="getArtListDate/{id}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<Artwork>> checkArtDate(@PathVariable("id") String id){
		return new ResponseEntity<>(artworkService.myPageArtWdate(id),HttpStatus.OK);
		
	}
}
