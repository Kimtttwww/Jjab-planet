package com.kh.corporation.model.vo;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Logo {
	private int fileNo;
	/** 로고 파일 주인 */
	private int corpNo;
	/** 업로드 당시 원래 파일 이름 */
	private String originName;
	/** 업로드 후 서버에 보관된 파일 이름 */
	private String changeName;
	/** 업로드 될 파일을 서버에 보관할 경로 */
	public static final String filePath = "resources/logo_upfiles/";
	/** 업로드 될 파일의 크기 제한(10MB) */
	public static final int fileSize = 10 * 1024 * 1024;
}