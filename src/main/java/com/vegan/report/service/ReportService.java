package com.vegan.report.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.report.dao.ReportDAO;
import com.vegan.report.dto.ReportDTO;

@Service
public class ReportService {

	@Autowired
	ReportDAO dao;

	public int report(HashMap<String, String> params) {

		return dao.report(params);
	}

	public ArrayList<ReportDTO> reportList() {

		return dao.reportList();
	}

	public ReportDTO reportDetail(String report_id) {
		// TODO Auto-generated method stub
		return dao.reportDetail(report_id);
	}

	public int reportStatus(String report_id, String status, String adminId) {
		// TODO Auto-generated method stub
		return dao.reportStatus(report_id, status, adminId);
	}

	public int userDisposal(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return dao.userDisposal(param);
	}

	public ArrayList<ReportDTO> history(String user_id) {
		// TODO Auto-generated method stub
		return dao.history(user_id);
	}

	public void delUser(String user_id) {
		dao.delUser(user_id);

	}

}
