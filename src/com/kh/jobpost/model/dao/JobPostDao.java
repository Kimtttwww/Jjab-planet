package com.kh.jobpost.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.jobpost.model.vo.JobPost;

public class JobPostDao {

	public JobPost detailBoard(SqlSession session, int jobpostNo) {
		return session.selectOne("jobpostMapper.detailPost", jobpostNo); 
	}

	
	
	public ArrayList<JobPost> selectList(SqlSession session, PageInfo pi, HashMap<String, String> h){
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return(ArrayList) session.selectList("jobpostMapper.selectList", h,rowBounds);
	}

	public int selectListCount(SqlSession sqlSession, HashMap<String, String> h) {
		return sqlSession.selectOne("jobpostMapper.selectListCount", h);
	}


	public int increaseCount(SqlSession sqlSession, int jobpostNo) {
		return sqlSession.update("jobpostMapper.increaseCount", jobpostNo);
	}

	public ArrayList<JobPost> idxSelectList(SqlSession session, PageInfo pi) {
		return(ArrayList) session.selectList("jobpostMapper.idx_selectList");
	}


	public ArrayList<JobPost> getPostsByCategory(SqlSession session, String category) {
		return  (ArrayList)session.selectList("jobpostMapper.getPostsByCategory", category);
	}


	public JobPost selectOne(SqlSession session, int corpNo) {
		
		return session.selectOne("jobpostMapper.selectOne", corpNo); 
	}
	
	
}