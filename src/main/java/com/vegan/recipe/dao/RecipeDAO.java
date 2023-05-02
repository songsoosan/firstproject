package com.vegan.recipe.dao;

import org.apache.ibatis.annotations.Param;

import com.vegan.recipe.dto.RecipeDTO;

public interface RecipeDAO {

	int write(RecipeDTO recipeDTO);

	void fileWrite(@Param("cat_id") String cat_id, @Param("ori_photo_name") String ori_photo_name, @Param("photo_name") String photo_name, @Param("idx") int idx);

}
