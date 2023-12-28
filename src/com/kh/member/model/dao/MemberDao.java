package com.kh.member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Member;

public class MemberDao {

	public Member loginMember(SqlSession sqlSession, HashMap<String, String> asdf) {
		
		return sqlSession.selectOne("memberMapper.loginMember", asdf);
		
	}

	public int insertMember(SqlSession sqlSession, Member m) {
		
		return 0;
	}

}
