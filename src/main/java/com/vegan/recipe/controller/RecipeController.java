package com.vegan.recipe.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.vegan.recipe.dto.RecipeDTO;
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
    public String detailPage(Model model, @RequestParam String rec_id) {

	    	
			RecipeDTO dto = service.detail(rec_id);
		    List<RecipeDTO> contents = service.detailContent(rec_id);

		   
		    	model.addAttribute("contents", contents);

		    
		    List<RecipeDTO> foods = service.detailFood(rec_id);
		    	for(RecipeDTO food : foods) {
		    		logger.info(food.getFood_name());
		    	}
		    	model.addAttribute("foods", foods);
		    	

		    String main_photo = service.mainPhoto(rec_id);
		    logger.info("main_phpto ="+main_photo);
		    
		    model.addAttribute("main_photo",main_photo);
		    	
		    List<RecipeDTO> photos = service.detailPhoto(rec_id);
		    Map<String, String> pho = new HashMap<>();
		    int x=0;
		    for (RecipeDTO photo : photos) {
		    	
		    	String val = photo.getPhoto_name();
		    	 logger.info(val);
		    	pho.put("photo_name"+x, val);
		    	x++;
		    }
		    for (String value : pho.values()) {
		        System.out.println(value);
		    }
		    model.addAttribute("photo", pho);
		    model.addAttribute("dto", dto);
		    
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
	
	
	
	@RequestMapping(value = "/recipe.go", method = RequestMethod.GET)
	public String recipe(Model model) {
		ArrayList <RecipeDTO> list = service.list();
		model.addAttribute("list",list);
		
		ArrayList <RecipeDTO> photos = service.listPhoto();
		Map<String, String> pho = new HashMap<>();
		 int x=0;
		for (RecipeDTO photo : photos) {

	    	String val = photo.getPhoto_name();
	    	 logger.info(val);
	    	pho.put("photo_name"+x, val);
	    	x++;
		}
		 model.addAttribute("photo", pho);
		
			return "recipeList";
	}
	

}

