package com.kh.semi.info.model.vo;

public class StoryFile extends Story{
	
	private String filePath;
	private String OriginName;
	private String ChangeName;
	private int boardNo; // BOARD_TYPE == 7

	
	
	public StoryFile() {
		super();
	}

	public StoryFile(String filePath, String originName, String changeName) {
		super();
		this.filePath = filePath;
		OriginName = originName;
		ChangeName = changeName;
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

	@Override
	public int getStoryNo() {
		return super.getStoryNo();
	}

	@Override
	public void setStoryNo(int storyNo) {
		super.setStoryNo(storyNo);
	}

	@Override
	public String getStoryTitle() {
		return super.getStoryTitle();
	}

	@Override
	public void setStoryTitle(String storyTitle) {
		super.setStoryTitle(storyTitle);
	}

	@Override
	public String getStoryContent() {
		return super.getStoryContent();
	}

	@Override
	public void setStoryContent(String storyContent) {
		super.setStoryContent(storyContent);
	}

	@Override
	public String getCreateDate() {
		return super.getCreateDate();
	}

	@Override
	public void setCreateDate(String createDate) {
		super.setCreateDate(createDate);
	}

	@Override
	public String getStoryFrom() {
		return super.getStoryFrom();
	}

	@Override
	public void setStoryFrom(String storyFrom) {
		super.setStoryFrom(storyFrom);
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginName() {
		return OriginName;
	}

	public void setOriginName(String originName) {
		OriginName = originName;
	}

	public String getChangeName() {
		return ChangeName;
	}

	public void setChangeName(String changeName) {
		ChangeName = changeName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((ChangeName == null) ? 0 : ChangeName.hashCode());
		result = prime * result + ((OriginName == null) ? 0 : OriginName.hashCode());
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		StoryFile other = (StoryFile) obj;
		if (ChangeName == null) {
			if (other.ChangeName != null)
				return false;
		} else if (!ChangeName.equals(other.ChangeName))
			return false;
		if (OriginName == null) {
			if (other.OriginName != null)
				return false;
		} else if (!OriginName.equals(other.OriginName))
			return false;
		if (filePath == null) {
			if (other.filePath != null)
				return false;
		} else if (!filePath.equals(other.filePath))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "StoryFile [filePath=" + filePath + ", OriginName=" + OriginName + ", ChangeName=" + ChangeName + "]";
	}
	
	
}
