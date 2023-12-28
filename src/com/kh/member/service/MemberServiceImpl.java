package com.kh.member.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberServiceImpl implements MemberService{

	//MemberService 에서 쓸 메소드 만들곳(구현체)
	private MemberDao memberDao = new MemberDao();
	
	@Override
	public Member loginMember(HashMap<String, String> asdf) {
		
		// Connection conn = getConnection();
		SqlSession sqlSession = Template.getSqlSession();
		
		Member loginUser = memberDao.loginMember(sqlSession, asdf);
		
		//close(conn);
		sqlSession.close();
		
		return loginUser;
		
		
	}

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
	

}
