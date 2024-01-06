package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class JjapFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		String originName = f.getName();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new java.util.Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		return new File(f.getParent(), currentTime + ranNum + ext);
	}
}