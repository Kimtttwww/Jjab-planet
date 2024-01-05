package com.kh.member.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.InterestCorpDao;
import com.kh.member.model.vo.InterestCorp;

public class InterestCorpService {
	InterestCorpDao dao = new InterestCorpDao();

	public int selectListCount(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();

		int listCount = dao.selectListCount(sqlSession, userNo);

		System.out.println(listCount+ " 서비스 리턴");
		sqlSession.close();

		return listCount;
	}

	public ArrayList<InterestCorp> selectList(PageInfo pi, int userNo) {
		SqlSession sqlSession = Template.getSqlSession();

		ArrayList<InterestCorp> list = dao.selectList(sqlSession, pi, userNo);
		
		sqlSession.close();
		return list;
	}

}
