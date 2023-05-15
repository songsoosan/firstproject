package com.vegan.report.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.report.dto.ReportDTO;
import com.vegan.report.service.ReportService;

@Controller
public class ReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	ReportService service;

	@RequestMapping(value = "/reportWrite.go")
	public String reportWrite(@RequestParam String board_id, Model model, @RequestParam String board_title,
			@RequestParam String cat_id, @RequestParam String user_id, @RequestParam String reporter) {
		model.addAttribute("board_id", board_id);
		model.addAttribute("board_title", board_title);
		model.addAttribute("cat_id", cat_id);
		model.addAttribute("user_id", user_id);
		model.addAttribute("reporter", reporter);
		logger.info("board_title" + board_title + user_id + reporter);

		return "reportWrite";
	}

	@RequestMapping(value = "/reportSend.ajax")
	@ResponseBody
	public HashMap<String, String> letterSend(@RequestParam HashMap<String, String> params, HttpSession session,
			Model model) {

		logger.info("sad" + params);
		HashMap<String, String> data = new HashMap();
		int row = service.report(params);
		if (row == 1) {
			data.put("success", "1");
			model.addAttribute("msg", "신고접수가 완료되었습니다.");
		} else {
			data.put("success", "0");
		}
		return data;
	}

	@RequestMapping(value = "/admin.reportList")
	public String ReportList(Model model) {
		ArrayList<ReportDTO> reportList = service.reportList();
		logger.info("list cnt : " + reportList.size());
		model.addAttribute("reportList", reportList);
		return "reportList";
	}
}
