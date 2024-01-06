package com.kh.member.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import static com.kh.common.Template.*;
import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	private MemberDao memberDao = new MemberDao();
	private SqlSession db = getSqlSession();
	
	public Member loginMember(HashMap<String, String> login) {
		SqlSession sqlSession = getSqlSession();
		
		Member loginUser = memberDao.loginMember(sqlSession, login);

		sqlSession.close();
		return loginUser;
	}

	/** 개인 회원가입
	 * @param m
	 * @return
	 */
	public boolean insertMember(Member m) {
		boolean result = memberDao.insertMember(db, m);
	
		if(result) {
			db.commit();
		}else {
			db.rollback();
		}
		
		if(m.getUserType().equals("E")) db.close();
		return result;
	}
	
	/** 기업 회원가입
	 * @param c
	 * @return
	 */
	public boolean insertMember(Corporation c, Logo l) {
		boolean result = memberDao.insertMember(db, c) && memberDao.insertMember(db, l);
		
		if(result) {
			db.commit();
		}else {
			db.rollback();
		}
		
		return result;
	}

	public Member selectMember(int userNo) {
		// Connection conn = getConnection();
		SqlSession sqlSession = Template.getSqlSession();
		
		Member m = memberDao.selectMember(sqlSession, userNo);
		
		//close(conn);
		sqlSession.close();
		
		return m;
	}
	
	public boolean updateMember(Member m) {
		boolean result = memberDao.updateMember(db, m);
		
		if(result) {
			db.commit();
		} else {
			db.rollback();
		}
		
		if(m.getUserType().equals("E")) db.close();
		return result;
	}

	public boolean updateMember(Corporation c) {
		boolean result = memberDao.updateMember(db, c);
		
		if(result) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result;
	}
}
