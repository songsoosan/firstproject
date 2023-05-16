package com.vegan.member.service;

import java.util.HashMap;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.member.dao.MemberDAO;
import com.vegan.member.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public HashMap<String, Object> overlayid(String user_id) {
			
			HashMap<String, Object> map = new HashMap<>();
			// 같은 아이디가 있는가? 있으면 1 없으면 0	
			map.put("overlayid", dao.overlayid(user_id));		
			return map;
		}
	
	public HashMap<String, Object> join(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("success", dao.join(params));		
		String user_id = params.get("user_id");
		dao.creatProfile(user_id);
		
		return map;
	}
	
	
		
		
		

	public String login(String id, String pw) {
		
		return dao.login(id, pw);
	}
	
	public HashMap<String, Object> sendMail(HashMap<String, String> params) {
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		MemberDTO userInfo = dao.getUserInfo(params);
		
		if(userInfo != null) {
			Properties props = new Properties();
			
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			Session session = Session.getInstance(props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("seou7607@gmail.com", "nyhaxmqyjjnkvdgi");	// 보내는 사람 메일, 앱 비밀번호(https://yermi.tistory.com/346)
				}
			});
			
			String receiver = userInfo.getUser_email(); // 메일 받을 주소
			String title = "[vegan] 이메일 찾기";	// 메일 제목
			String content = "<b> 아이디 : " + userInfo.getUser_id() + "</b>";	// 메일 내용
			Message message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress("seou7607@gmail.com", "관리자", "utf-8"));	// 보내는 사람 메일, 보내는 사람 이름
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
				message.setSubject(title);
				message.setContent(content, "text/html; charset=utf-8");
	 
				Transport.send(message);
				resMap.put("code", "COMPLETE");
			} catch (Exception e) {
				e.printStackTrace();
				resMap.put("code", "ERROR");
			}
		} else {
			resMap.put("code", "NO_DATA");
		}
		
		return resMap;
	}
	
	public HashMap<String, Object> sendPWMail(HashMap<String, String> params) {
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		MemberDTO userInfoPW = dao.getUserInfoPW(params);
		logger.info(userInfoPW.getUser_name());
		if(userInfoPW != null) {
			Properties props = new Properties();
			
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			Session session = Session.getInstance(props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("seou7607@gmail.com", "nyhaxmqyjjnkvdgi");	// 보내는 사람 메일, 앱 비밀번호(https://yermi.tistory.com/346)
				}
			});
			
			String receiver = userInfoPW.getUser_email(); // 메일 받을 주소
			String title = "[vegan] 비밀번호 찾기";	// 메일 제목
			String content = "<b> 비밀번호 : " + userInfoPW.getUser_pw() + "</b>";	// 메일 내용
			Message message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress("seou7607@gmail.com", "관리자", "utf-8"));	// 보내는 사람 메일, 보내는 사람 이름
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
				message.setSubject(title);
				message.setContent(content, "text/html; charset=utf-8");
				
				Transport.send(message);
				resMap.put("code", "TRANSFER_COMPLETE");
			} catch (Exception e) {
				e.printStackTrace();
				resMap.put("code", "ERROR");
			}
		} else {
			resMap.put("code", "NO_MATCHING_DATA");
		}
		
		return resMap;
	}

	
	
}
