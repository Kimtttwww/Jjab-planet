package com.kh.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
// 매개변수 없는 생성자

@Getter
@Setter
@AllArgsConstructor
@ToString
@Builder

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String phone;
	private String status;
	private String userType;

	public void test() {

		System.out.println();
	}

}