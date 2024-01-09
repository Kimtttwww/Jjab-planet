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

	public Corporation selectCorpOne(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		Corporation corp = corpDao.selectCorpOne(sqlSession, corpCode);

		sqlSession.close();
		return corp;
	}

	public JobPost selectJobPostList(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		JobPost jobPost = corpDao.selectJobPostList(sqlSession, corpCode);

		sqlSession.close();
		return jobPost;
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


	public int corplikeInsert(int corpCode, int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("corpCode", corpCode);
		map.put("userNo", userNo);
		
		int corplike = corpDao.corplikeInsert(sqlSession, map);
		
		if(corplike > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return corplike;
	}

	public int corplikeCount(int corpCode) {
		SqlSession sqlSession = Template.getSqlSession();
		int corplike = corpDao.corplikeCount(sqlSession, corpCode);
		
		if(corplike > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return corplike;
	}

	public int corplikeUnCount(int corpCode) {
		
		SqlSession sqlSession = Template.getSqlSession();
		int corplike = corpDao.corplikeUnCount(sqlSession, corpCode);
		
		if(corplike > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return corplike;
	}

	public int corplikeDelete(int corpCode, int userNo) {
		
		SqlSession sqlSession = Template.getSqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("corpCode", corpCode);
		map.put("userNo", userNo);
		
		int corplike = corpDao.corplikeDelete(sqlSession, map);
		
		if(corplike > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
		return corplike;
		
	}

	// 유저의 관심기업 설정여부 체크
	public boolean isCorpLiked(int corpCode, int userNo) {
		
		SqlSession sqlSession = Template.getSqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("corpCode", corpCode);
		map.put("userNo", userNo);
		
		boolean corplike = corpDao.isCorpLiked(sqlSession, map);
		
		if(corplike) {
			corplike = true; 
		}else {
			corplike = false; 
		}
		
		sqlSession.close();
		return corplike;
		
	}

	public int insertReview(Reply review) {
		
		SqlSession sqlSession = Template.getSqlSession();
		int result = corpDao.insertReview(sqlSession, review);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}

	public int updateReview(int refNo, int replyNo, String replyContent) {
		System.out.println(replyNo);
		SqlSession sqlSession = Template.getSqlSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("refNo", String.valueOf(refNo));
		map.put("replyNo", String.valueOf(replyNo));
		map.put("replyContent", replyContent);
		
		int result = corpDao.updateReview(sqlSession, map);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}

	public int deleteReview(int replyNo) {
		
		SqlSession sqlSession = Template.getSqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("replyNo", replyNo);
		
		int result = corpDao.deleteReview(sqlSession, map);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}



}
