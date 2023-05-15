package com.vegan.report.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.vegan.report.dto.ReportDTO;

public interface ReportDAO {

	int report(HashMap<String, String> params);

	ArrayList<ReportDTO> reportList();
	
	

}
