package com.kh.corporation.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;
import com.kh.jobpost.model.vo.JobPost;

public class CorporationDao {

	public int corpCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.corpCount");	
	}
	
	public int reviewCount(SqlSession sqlSession, int corpCode) {
		Integer count = sqlSession.selectOne("boardMapper.reviewCount", corpCode);
		return count;		
	}
	
	public List<Corporation> selectCorpList(SqlSession sqlSession, PageInfo pi) {
		
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage() -1) * limit;		
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		List<Corporation> list = sqlSession.selectList("boardMapper.selectCorpList", null, rowBounds);
		
		return list;
	}

	public List<Reply> selectReviewList(SqlSession sqlSession, PageInfo pi , int corpCode) {
		
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage() -1) * limit;		
		
		RowBounds rowBounds = new RowBounds(offset, limit);				
		
		return  sqlSession.selectList("boardMapper.selectReviewList", corpCode, rowBounds);
	}

	public List<Corporation> selectCorpOne(SqlSession sqlSession, int corpCode) {
		
		return sqlSession.selectList("boardMapper.selectCorpOne", corpCode);
	}

	public List<JobPost> selectJobPostList(SqlSession sqlSession, int corpCode) {
		
		return sqlSession.selectList("boardMapper.selectJobPostList", corpCode);
	}

	public List<Logo> selectLogoOne(SqlSession sqlSession, int corpCode) {
		
		return sqlSession.selectList("boardMapper.selectLogoOne", corpCode);
	}

	public List<Logo> selectLogoList(SqlSession sqlSession, int corpCode) {

		return sqlSession.selectList("boardMapper.selectLogoList", corpCode);
	}


	public int corplikeInsert(SqlSession sqlSession, HashMap<Integer, Integer> map) {
		Integer corplike = sqlSession.selectOne("boardMapper.corplikeInsert", map);
		return corplike;
	}

	public int corplikeCount(SqlSession sqlSession, int corpCode) {
		return sqlSession.selectOne("boardMapper.corplikeCount", corpCode);	
	}

	
}
