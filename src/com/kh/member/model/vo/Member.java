package com.kh.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String phone;
	/** 상태(Y / N) */
	private String status;
	/** A : 관리자, E : 개인, C : 기업 */
	private String userType;
}