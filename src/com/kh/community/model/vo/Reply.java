package com.kh.community.model.vo;

import java.sql.Date;

import com.kh.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder

public class Reply {
	
	
	private int replyNo;
	private int refNo;
	private String replyContent;
	private String replyWriter;
	private Date createDate;
	private String status;
	/** C : 커뮤니티 댓글 / R : 기업리뷰 */
	private String replyType;
	
	
	private String userId;
	
	
	
	
}
