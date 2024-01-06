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
	private int noticeNo;
	private int receiver;
	private int noticeType;
	private String noticeText;
}