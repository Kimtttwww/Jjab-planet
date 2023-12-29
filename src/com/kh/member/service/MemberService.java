package com.kh.member.service;

import java.util.HashMap;

import com.kh.member.model.vo.Member;

//인터페이스 : 상수필드(public static final) + 추상메소드(public abstract)
public interface MemberService {

	Member loginMember(HashMap<String, String> login);
	
}
