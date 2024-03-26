package com.kh.semi.customer.model.vo;

public class NoticeFile {
	private int fileNo;
	private int boardType;
	private int boardNo;
	private String filePath;
	private String originName;
	private String changeName;
	
	public NoticeFile() {
		super();
	}
	public NoticeFile(int fileNo, int boardType, int boardNo, String filePath, String originName, String changeName) {
		super();
		this.fileNo = fileNo;
		this.boardType = boardType;
		this.boardNo = boardNo;
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	@Override
	public String toString() {
		return "NoticeFile [fileNo=" + fileNo + ", boardType=" + boardType + ", boardNo=" + boardNo + ", filePath="
				+ filePath + ", originName=" + originName + ", changeName=" + changeName + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardNo;
		result = prime * result + boardType;
		result = prime * result + ((changeName == null) ? 0 : changeName.hashCode());
		result = prime * result + fileNo;
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		result = prime * result + ((originName == null) ? 0 : originName.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeFile other = (NoticeFile) obj;
		if (boardNo != other.boardNo)
			return false;
		if (boardType != other.boardType)
			return false;
		if (changeName == null) {
			if (other.changeName != null)
				return false;
		} else if (!changeName.equals(other.changeName))
			return false;
		if (fileNo != other.fileNo)
			return false;
		if (filePath == null) {
			if (other.filePath != null)
				return false;
		} else if (!filePath.equals(other.filePath))
			return false;
		if (originName == null) {
			if (other.originName != null)
				return false;
		} else if (!originName.equals(other.originName))
			return false;
		return true;
	}
	
	
	
	
}
