package com.kh.corporation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Logo {
	private int fileNo;
	private int corpNo;
	private String originName;
	private String changeName;
	private String filePath;
}