package com.kh.semi.info.model.vo;

public class Language {
	
	private int nationNo;
	private int languageNo;
	private String languageName;
	
	public Language() {
		super();
	}

	public Language(int nationNo, String languageName) {
		super();
		this.nationNo = nationNo;
		this.languageName = languageName;
	}

	public int getLanguageNo() {
		return languageNo;
	}

	public void setLanguageNo(int languageNo) {
		this.languageNo = languageNo;
	}

	public int getNationNo() {
		return nationNo;
	}

	public void setNationNo(int nationNo) {
		this.nationNo = nationNo;
	}

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((languageName == null) ? 0 : languageName.hashCode());
		result = prime * result + nationNo;
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
		Language other = (Language) obj;
		if (languageName == null) {
			if (other.languageName != null)
				return false;
		} else if (!languageName.equals(other.languageName))
			return false;
		if (nationNo != other.nationNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return languageName;
	}
	
	
	
	
}
