package com.kh.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Admin {
	private int noticeNo; // 알림번호
	private int receiver; // 사용자 번호
	private int noticeType; // 알림유형
	// 1. 포지션 제안, 2. 관심 기업, 3.기업의 이력서 열람, 4. 내글에 댓글
	private String noticeText; // 알림내용
}
