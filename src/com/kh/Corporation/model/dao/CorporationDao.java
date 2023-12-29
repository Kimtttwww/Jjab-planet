package com.kh.corporation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;

public class CorporationDao {

	public int selectReviewListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectReviewListCount");
	}

	public ArrayList<Reply> selectReviewList(SqlSession sqlSession, PageInfo pi) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReviewList");
	}

	
	
	
	
	
	
	
	
}
