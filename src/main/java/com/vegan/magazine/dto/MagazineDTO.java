package com.vegan.magazine.dto;

import java.sql.Date;

public class MagazineDTO {
   
   // board dto
   private int board_id;
   private String user_id;
   private String board_title;
   private String board_content;
   private Date board_date;
   private int board_views;
   private int photo_id;
   private String photo_name;
   private String cat_id;
   
   // comment dto
   private int comment_id;
   private Date comment_date;
   private String comment_content;
   
   
   
   
   public String getComment_content() {
      return comment_content;
   }
   public void setComment_content(String comment_content) {
      this.comment_content = comment_content;
   }
   public int getComment_id() {
      return comment_id;
   }
   public void setComment_id(int comment_id) {
      this.comment_id = comment_id;
   }
   public Date getComment_date() {
      return comment_date;
   }
   public void setComment_date(Date comment_date) {
      this.comment_date = comment_date;
   }

   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getCat_id() {
      return cat_id;
   }
   public void setCat_id(String cat_id) {
      this.cat_id = cat_id;
   }
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
   public int getBoard_id() {
      return board_id;
   }
   public void setBoard_id(int board_id) {
      this.board_id = board_id;
   }
   
   public String getBoard_title() {
      return board_title;
   }
   public void setBoard_title(String board_title) {
      this.board_title = board_title;
   }
   public String getBoard_content() {
      return board_content;
   }
   public void setBoard_content(String board_content) {
      this.board_content = board_content;
   }
   public Date getBoard_date() {
      return board_date;
   }
   public void setBoard_date(Date board_date) {
      this.board_date = board_date;
   }
   public int getBoard_views() {
      return board_views;
   }
   public void setBoard_views(int board_views) {
      this.board_views = board_views;
   }

}

   
   
