package com.kh.jobpost.model.vo;

import java.sql.Date;

import com.kh.corporation.model.vo.Corporation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class JobPost {
	private int jobpostNo; //JOB_POST
	private int corpNo;//CORPORATION
	private String postTitle; //JOB_POST
	private String postContent; //JOB_POST
	private String education; //JOB_POST
	private String career; //JOB_POST
	private String location; //JOB_POST
	private Date createDate; //JOB_POST
	private Date endDate; //JOB_POST
	private int count; //JOB_POST
	private String jobName; //occupation
	private String phone; //MEMBER
	private String userType;//USER_TYPE
	private Corporation corp;
}