package com.vegan.report.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.report.dao.ReportDAO;

@Service
public class ReportService {
	
	@Autowired ReportDAO dao;
	public int report(HashMap<String, String> params) {
		
		return dao.report(params);
	}

}
