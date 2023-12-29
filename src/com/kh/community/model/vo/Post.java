package com.kh.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Post {
	private int postNo;
	private String postTitle;
	private String postContent;
	private int postWriter;
	private int count;
	private Date createDate;
	/** 게시글 게시 여부(Y / N) */
	private String status;
	/** A : 전체 / I : 면접 / C : 자격증 / S : 자소서 */
	private String category;
	private String userId;
}