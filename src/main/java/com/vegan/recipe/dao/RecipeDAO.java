package com.vegan.recipe.dao;


import org.apache.ibatis.annotations.Param;

import com.vegan.recipe.dto.RecipeDTO;

public interface RecipeDAO {

	int write(RecipeDTO recipeDTO);

	void fileWrite(@Param("identify_number") int identify_number, @Param("photo_number") int photo_number,@Param("ori_photo_name") String ori_photo_name, @Param("photo_name") String photo_name,  @Param("cat_id") String cat_id);

	int writeContent(RecipeDTO dto);

	int writeFood(RecipeDTO dto);

}
