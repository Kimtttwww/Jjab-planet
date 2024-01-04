package com.kh.jobpost.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class JobPost {
	private int jobpostNo; //JOP_POST
	private int corpNo;//CORPORATION
	private String postTitle; //JOP_POST
	private String postContent; //JOP_POST
	private Date createDate;
	private Date endDate; //JOP_POST
	private String jobName;// 
	private String status;
	private int count; //JOP_POST
	private String career; //JOP_POST
	private String education; //JOP_POST
	private String location; //JOP_POST
	
	
		 
/*공고제목
	휴대폰번호
	학력
	경력여부
	직종
	지역
	채용마감일
	채용세부내용*/
}
