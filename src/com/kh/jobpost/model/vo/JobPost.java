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

//이 VO 이상함!@@
//ceoName이랑 phone이 왜있는지? 
//jobNo이랑 jobName이랑 둘다 있는지?
//createDate는 왜 없는지 -> 내가 추가함
//VO에 필드명 막추가하지마@@@@ -> 2024.1.4 다연

public class JobPost {
	private int jobpostNo; //JOB_POST
	private int corpNo;//CORPORATION
	private String postTitle; //JOB_POST
	private String postContent; //JOB_POST
	private String education; //JOB_POST
	private String career; //JOB_POST
	private String location; //JOB_POST
	private Date endDate; //JOB_POST
	private int count; //JOB_POST
	private String jobName; //occupation
//	private String phone; //MEMBER
	private String corpName;//CORPORATION
	private String ceoName;//CORPORATION
	private String userType;//USER_TYPE
}

