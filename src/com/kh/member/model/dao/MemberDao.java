package com.kh.member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.corporation.model.vo.Corporation;
import com.kh.member.model.vo.Member;

public class MemberDao {
	String map = "memberMapper.";
	public Member loginMember(SqlSession sqlSession, HashMap<String, String> login) {
		return sqlSession.selectOne(map + "loginMember", login);
	}

	public int insertMember(SqlSession sqlSession, Member m) {
		return sqlSession.insert(map + "insertMember", m);
	}
	
	public int insertMembera(SqlSession sqlSession, Corporation c) {
		return sqlSession.insert(map + "insertCorp", c);
	}

	public int updateMember(SqlSession db, Member m) {
		return db.update(map + "updateMember", m);
	}

	public int updateMember(SqlSession db, Corporation c) {
		return db.update(map + "updateCorporation", c);
	}
}