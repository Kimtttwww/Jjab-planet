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

	/** 개인 회원가입
	 * @param m
	 * @return
	 */
	public int insertMember(Member m) {
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
	
	/** 기업 회원가입
	 * @param c
	 * @return
	 */
	public int insertMembera(Corporation c) {
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

	public boolean updateMember(Member m) {
		SqlSession db = Template.getSqlSession();
		
		int result = memberDao.updateMember(db, m);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result > 0;
	}

	public boolean updateMember(Corporation c) {
		SqlSession db = Template.getSqlSession();
		
		int result = memberDao.updateMember(db, c);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result > 0;
	}
	
	

}