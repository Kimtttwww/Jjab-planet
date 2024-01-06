package com.kh.member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;
import com.kh.member.model.vo.Member;

public class MemberDao {
	String map = "memberMapper.";
	
	
	public Member loginMember(SqlSession sqlSession, HashMap<String, String> login) {
		return sqlSession.selectOne(map + "loginMember", login);
	}

	public boolean insertMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert(map + "insertMember", m) > 0;
	}
	
	public boolean insertMember(SqlSession sqlSession, Corporation c) {
		return sqlSession.insert(map + "insertCorp", c) > 0;
	}
	
	public boolean insertMember(SqlSession sqlSession, Logo l) {
		return sqlSession.insert(map + "insertLogo", l) > 0;
	}

	public Member selectMember(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.selectMember", userNo);
	}

	public boolean updateMember(SqlSession db, Member m) {
		return db.update(map + "updateMember", m) > 0;
	}

	public boolean updateMember(SqlSession db, Corporation c) {
		return db.update(map + "updateCorporation", c) > 0;
	}
}
