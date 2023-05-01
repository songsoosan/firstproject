package com.vegan.classes.dao;

import java.util.ArrayList;

import com.vegan.classes.dto.ClassesDTO;

public interface ClassesDAO {

	ArrayList<ClassesDTO> list();

	int write(ClassesDTO dto);

}
