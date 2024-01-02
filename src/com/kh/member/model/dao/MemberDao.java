package com.kh.member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.corporation.model.vo.Corporation;
import com.kh.member.model.vo.Member;

public class MemberDao {

	public Member loginMember(SqlSession sqlSession, HashMap<String, String> login) {
		
		return sqlSession.selectOne("memberMapper.loginMember", login);
		
	}

	public int insertMember(SqlSession sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	
	public int insertMember(SqlSession sqlSession, Corporation c) {
		
		return sqlSession.insert("memberMapper.insertMember", c);
	}

}
