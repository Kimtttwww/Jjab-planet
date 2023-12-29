package com.kh.report.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Report {
	private int reportNo;
	/** 게시글, 댓글, 리뷰의 번호 */
	private int refNo;
	/** P : 게시글,  R : 댓글, C : 리뷰 */
	private int refType;
	private String reportContent;
}