package com.vegan.recipe.controller;



import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.vegan.recipe.service.RecipeService;



@Controller
public class RecipeController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RecipeService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(Model model) {
			return "recipeWrite";
	}
	
	@RequestMapping(value="/recipe.write.go")
    public String writePage() {
        return "recipeWrite";  
    }
	
	@RequestMapping(value="/recipe.detail.do")
    public String detailPage(@RequestParam String rec_id) {
        return "recipe";  
    }
	
	@RequestMapping(value="/recipe.write.do" , method = {RequestMethod.GET,RequestMethod.POST})
    public String write(@RequestParam MultipartFile rec_photo, @RequestParam  List<MultipartFile> thumbnailFile,
			@RequestParam HashMap<String, String> params) {
		
		logger.info("hello");
		
		Iterator<String> iterator = params.keySet().iterator();
		while(iterator.hasNext()) {
			String key = (String)iterator.next();
			System.out.print("key = " + key);
			System.out.println(" value = " + params.get(key));
		}
		
		for (MultipartFile file : thumbnailFile) {
		  logger.info(file.getOriginalFilename());  
		}

        return service.write(rec_photo,thumbnailFile, params);  
    }

}
