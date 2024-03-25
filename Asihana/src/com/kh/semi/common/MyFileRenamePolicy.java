package com.kh.semi.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	public File rename(File originFile) {
		String originName = originFile.getName();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int random = (int)(Math.random() * 90000) + 10000;
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = "ASIHANA_" + currentTime + "_" + random + ext;
		
		return new File(originFile.getParent(), changeName);
	}
}
