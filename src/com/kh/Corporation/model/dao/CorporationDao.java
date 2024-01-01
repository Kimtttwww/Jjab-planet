package com.kh.corporation.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.vo.Corporation;

public class CorporationDao {

	public int corpCount(SqlSession sqlSession) {
		return sqlSession.selectOne("boardMapper.corpCount");	
	}
	
	public int reviewCount(SqlSession sqlSession, int corpCode) {
		Integer count = sqlSession.selectOne("boardMapper.reviewCount", corpCode);
		System.out.println("count : " + count);
		return count;		
	}
	
	public List<Corporation> selectCorpList(SqlSession sqlSession, PageInfo pi) {
		
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage() -1) * limit;		
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		List<Corporation> list = sqlSession.selectList("boardMapper.selectCorpList", null, rowBounds);
		//System.out.println(list);
		
		return list;
	}

	public List<Reply> selectReviewList(SqlSession sqlSession, PageInfo pi , int corpCode) {
		
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage() -1) * limit;		
		
		RowBounds rowBounds = new RowBounds(offset, limit);				
		
		return  sqlSession.selectList("boardMapper.selectReviewList", corpCode, rowBounds);
	}

	
}
