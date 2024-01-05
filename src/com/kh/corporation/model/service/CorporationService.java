package com.kh.corporation.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.dao.CorporationDao;
import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;
import com.kh.jobpost.model.vo.JobPost;

public class CorporationService {

	private CorporationDao corpDao = new CorporationDao();

	public int corpCount()	{		
		SqlSession sqlSession = Template.getSqlSession();
		int count = corpDao.corpCount(sqlSession);
		sqlSession.close();
		return count;
	}

	public int reviewCount(int corpCode) {
		SqlSession sqlSession = Template.getSqlSession();
		int count = corpDao.reviewCount(sqlSession, corpCode);
		sqlSession.close();
		return count;
	}

	public List<Corporation> selectCorpList(PageInfo pi) {

		SqlSession sqlSession = Template.getSqlSession();

		List<Corporation> list = corpDao.selectCorpList(sqlSession, pi);
		sqlSession.close();

		return list;
	}

	public List<Reply> selectReviewList(PageInfo pi, int corpCode) {

		SqlSession sqlSession = Template.getSqlSession();
		List<Reply> list = corpDao.selectReviewList(sqlSession, pi, corpCode);

		sqlSession.close();
		return list;
	}

	public List<Corporation> selectCorpOne(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		List<Corporation> list = corpDao.selectCorpOne(sqlSession, corpCode);

		sqlSession.close();
		return list;
	}

	public List<JobPost> selectJobPostList(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		List<JobPost> list = corpDao.selectJobPostList(sqlSession, corpCode);

		sqlSession.close();
		return list;
	}

	public List<Logo> selectLogoOne(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		List<Logo> list = corpDao.selectLogoOne(sqlSession, corpCode);

		sqlSession.close();
		return list;
	}

	public List<Logo> selectLogoList(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		List<Logo> list = corpDao.selectLogoList(sqlSession, corpCode);

		sqlSession.close();
		return list;
	}


	public int corplikeInsert(HashMap<Integer, Integer> map) {
		
		SqlSession sqlSession = Template.getSqlSession();
		int corplike = corpDao.corplikeInsert(sqlSession, map);
		sqlSession.close();
		return corplike;
	}

	public int corplikeCount(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		int corplike = corpDao.corplikeCount(sqlSession, corpCode);
		sqlSession.close();
		return corplike;
	}


}
