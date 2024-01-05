package com.kh.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Notice {
//	NOTICE_NO	NUMBER
//	RECEIVER	NUMBER
//	NOTICE_TYPE	NUMBER
	private int noticeNo;
	private int receiver;
	private int noticeType;
	private String noticeText;
}