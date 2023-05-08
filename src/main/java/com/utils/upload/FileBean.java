package com.utils.upload;

public class FileBean {
	private String	fileName			= "";
	private String	storedFileName		= "";
	private Long	fileSize			= 0L;
	private String	contentType			= "";
	private String	fileUrlPath			= "";
	private String	videoThumbnailPath	= "";
	private String	fileExtension;
	private String 	key;
	private byte[]	fileObject ;
	
	

	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getStoredFileName() {
		return storedFileName;
	}



	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}



	public Long getFileSize() {
		return fileSize;
	}



	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}



	public String getContentType() {
		return contentType;
	}



	public void setContentType(String contentType) {
		this.contentType = contentType;
	}



	public String getFileUrlPath() {
		return fileUrlPath;
	}



	public void setFileUrlPath(String fileUrlPath) {
		this.fileUrlPath = fileUrlPath;
	}



	public String getVideoThumbnailPath() {
		return videoThumbnailPath;
	}



	public void setVideoThumbnailPath(String videoThumbnailPath) {
		this.videoThumbnailPath = videoThumbnailPath;
	}



	public String getFileExtension() {
		return fileExtension;
	}



	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}



	public String getKey() {
		return key;
	}



	public void setKey(String key) {
		this.key = key;
	}



	public byte[] getFileObject() {
		return fileObject;
	}



	public void setFileObject(byte[] fileObject) {
		this.fileObject = fileObject;
	}



	@Override
	public String toString() {
		return "FileBean{" +
				"fileName='" + fileName + '\'' +
				", storedFileName='" + storedFileName + '\'' +
				", fileSize=" + fileSize +
				", contentType='" + contentType + '\'' +
				", fileUrlPath='" + fileUrlPath + '\'' +
				", fileExtension='" + fileExtension + '\'' +
				", videoThumbnailPath='" + videoThumbnailPath + '\'' +
				", key='" + key + '\'' +
				'}';
	}
}

