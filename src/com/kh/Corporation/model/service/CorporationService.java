package com.kh.corporation.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.dao.CorporationDao;



public class CorporationService {
	
	private CorporationDao corpDao = new CorporationDao();

	
	public int selectReviewListCount() {
		
		SqlSession sqlSession = Template.getSqlSession();
		
		int reviewListCount = corpDao.selectReviewListCount(sqlSession);
		sqlSession.close();
		
		return reviewListCount;
	}

	public ArrayList<Reply> selectReviewList(PageInfo pi) {
		
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Reply> list = corpDao.selectReviewList(sqlSession, pi);
		
		sqlSession.close();
		return list;
	}

}
