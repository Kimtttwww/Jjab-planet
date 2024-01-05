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
	private String education; //JOP_POST
	private String career; //JOP_POST
	private String location; //JOP_POST
	private Date endDate; //JOP_POST
	private int count; //JOP_POST
	private String jobNo;// JOB_NO
	private String jobName; //occupation
	private String phone; //MEMBER
	private String corpName;//CORPORATION
	private String ceoName;//CORPORATION
	private String userType;//USER_TYPE
}
