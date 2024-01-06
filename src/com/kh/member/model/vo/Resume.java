package com.kh.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Resume {
	private int workerNo; //구직자번호
	private String formTitle; //이력서명
	private String workerName; //구직자이름
	private Date birthday; // 생년월일
	private String gender; //성별
	private String address; //주소
	private String jobName; //직종이름
	private String isOpen; //공개여부
	private String career; //경력
	private String education; //학력
	
	//테이블 RESUME;

}
