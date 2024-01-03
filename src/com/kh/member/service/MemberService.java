package com.kh.member.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.corporation.model.vo.Corporation;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	//MemberService 에서 쓸 메소드 만들곳(구현체)
	private MemberDao memberDao = new MemberDao();
	
	public Member loginMember(HashMap<String, String> login) {
		
		// Connection conn = getConnection();
		SqlSession sqlSession = Template.getSqlSession();
		
		Member loginUser = memberDao.loginMember(sqlSession, login);
		
		//close(conn);
		sqlSession.close();
		
		return loginUser;
		
		
	}

	public int insertMember(Member m) {
//		개인 회원가입
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = memberDao.insertMember(sqlSession, m);
	
		if(result > 0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
		
	}
	
	public int insertMembera(Corporation c) {
//		기업회원가입
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = memberDao.insertMembera(sqlSession, c);
	
		if(result > 0) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
		
	}
	

}
