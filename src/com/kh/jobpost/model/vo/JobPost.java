package com.kh.jobpost.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class JobPost {
	private int jobpostNo; //JOP_POST
	private String postTitle; //JOP_POST
	private String education; //JOP_POST
	private String career; //JOP_POST
	private String location; //JOP_POST
	private Date createDate;
	private Date endDate; //JOP_POST
	private String postContent; //JOP_POST
	private int corpNo;//CORPORATION
	private int count; //JOP_POST
	private String jobNo;// JOB_NO
	private String status;// STATUS	
	
		
	private String jobName; //occupation
	private String corpName; // CORP_NAME

		
	private ArrayList<JobPost> list;
	private ArrayList<JobPost> idx_list;

		 
//	private int corpNo; //JOP_POST
//	private String status; //JOP_POST
//	private int count; //JOP_POST
	
/*공고제목
	휴대폰번호
	학력
	경력여부
	직종
	지역
	채용마감일
	채용세부내용*/
}
