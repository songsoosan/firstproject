package com.vegan.report.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.vegan.report.dto.ReportDTO;

public interface ReportDAO {

	int report(HashMap<String, String> params);

	ArrayList<ReportDTO> reportList();

	ReportDTO reportDetail(String report_id);


	int reportStatus(@Param("report_id")String report_id, @Param("status")String status,@Param("adminId") String adminId);

	int userDisposal(HashMap<String, String> param);

	ArrayList<ReportDTO> history(String user_id);

	 void delUser(String user_id); 
	
	

}
