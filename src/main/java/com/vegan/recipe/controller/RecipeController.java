package com.vegan.recipe.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.vegan.recipe.service.RecipeService;



@Controller
@RequestMapping(value="/recipe")
public class RecipeController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RecipeService recipeService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main(Model model) {
			return "recipeWrite";
	}
	
	@RequestMapping(value="/write.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String write(MultipartHttpServletRequest request) {
        return (new Gson()).toJson(recipeService.write(request));  
    }
}
