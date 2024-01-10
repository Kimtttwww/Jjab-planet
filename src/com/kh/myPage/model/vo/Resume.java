package com.kh.myPage.model.vo;
import java.sql.Date;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Resume {
	private int workerNo;
	private String formTitle;
	private String workerName;
	private Date birthday;
	private String gender;
	private String address;
	private String jobNo;
	private String jobName;
	private String isOpen;
	private String career;
	private String education;
}