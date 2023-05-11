package com.vegan.event.dto;

import java.sql.Date;

public class EventDTO {
	
		// event dto
		private int event_id;
		private String cat_id;
		private String user_id;
		private String event_title;
		private String event_content;
		private String event_video_link;
		private Date event_start_date;
		private Date event_end_date;
		private Date event_date;
		private boolean event_status;
		private int photo_id;
		private String photo_name;

		
		

		public int getPhoto_id() {
			return photo_id;
		}
		public void setPhoto_id(int photo_id) {
			this.photo_id = photo_id;
		}
		public String getPhoto_name() {
			return photo_name;
		}
		public void setPhoto_name(String photo_name) {
			this.photo_name = photo_name;
		}
		public String getCat_id() {
			return cat_id;
		}
		public void setCat_id(String cat_id) {
			this.cat_id = cat_id;
		}
		public int getEvent_id() {
			return event_id;
		}
		public void setEvent_id(int event_id) {
			this.event_id = event_id;
		}
		public String getEvent_title() {
			return event_title;
		}
		public void setEvent_title(String event_title) {
			this.event_title = event_title;
		}
		public String getEvent_content() {
			return event_content;
		}
		public void setEvent_content(String event_content) {
			this.event_content = event_content;
		}
		public String getEvent_video_link() {
			return event_video_link;
		}
		public void setEvent_video_link(String event_video_link) {
			this.event_video_link = event_video_link;
		}
		public Date getEvent_start_date() {
			return event_start_date;
		}
		public void setEvent_start_date(Date event_start_date) {
			this.event_start_date = event_start_date;
		}
		
		public Date getEvent_end_date() {
			return event_end_date;
		}
		public void setEvent_end_date(Date event_end_date) {
			this.event_end_date = event_end_date;
		}
		public boolean isEvent_status() {
			return event_status;
		}
		public void setEvent_status(boolean event_status) {
			this.event_status = event_status;
		}
		
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public Date getEvent_date() {
			return event_date;
		}
		public void setEvent_date(Date event_date) {
			this.event_date = event_date;
		}
		
		

		

}
