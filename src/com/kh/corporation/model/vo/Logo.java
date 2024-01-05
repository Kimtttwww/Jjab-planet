package com.kh.corporation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Data
public class Logo {
	private int fileNo;
	private int corpNo;
	private String originName;
	private String changeName;
	public static final String filePath = "resources/logo_uofiles/";
}