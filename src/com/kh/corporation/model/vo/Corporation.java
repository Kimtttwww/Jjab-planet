package com.kh.corporation.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Corporation {
	private int corpNo;
	private String corpName;
	private String ceoName;
	private String corpBn;
	private String address;
	/** 직종 번호(F : 프론트, B : 백, S : 풀스텍) */
	private String jobNo;
	private int likeCount;
	private String homepage;
	private Logo logo;
}
