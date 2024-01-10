package com.kh.jobpost.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.jobpost.model.dao.JobPostDao;
import com.kh.jobpost.model.vo.JobPost;

public class JobPostService {
	private JobPostDao dao = new JobPostDao();

	public JobPost detailPost(int jobpostNo) {
		SqlSession session = Template.getSqlSession();

		JobPost p = dao.detailBoard(session, jobpostNo);

		//간단한 조회이기때문에 트랜젝션 할 필요없어서 클로즈 하면됨
		session.close();
		return p;
	}
	
	
//	 public JobPost detailPost(int jobpostNo) {
//		 SqlSession session = Template.getSqlSession();
//		 JobPost jobPost = dao.detailPost(session, jobpostNo);
//		 session.close();
//		 return jobPost;
//
//	 }
	
	
	

	public ArrayList<JobPost> selectList(PageInfo pi, String category, String keyword) {
		SqlSession session = Template.getSqlSession();

		HashMap<String, String> h = new HashMap<String, String>();
		h.put("category", category);
		h.put("keyword", keyword);
		
		ArrayList<JobPost> list = dao.selectList(session, pi, h);
		
		session.close();
		return list;
	}

	public int selectListCount(String category, String keyword) {
		SqlSession sqlSession = Template.getSqlSession();

		HashMap<String, String> h = new HashMap<String, String>();
		h.put("category", category);
		h.put("keyword", keyword);
		
		int listCount = dao.selectListCount(sqlSession, h);

		sqlSession.close();
		return listCount;
	}

	public int increaseCount(int jobpostNo) {
		SqlSession sqlSession = Template.getSqlSession();

		int count = dao.increaseCount(sqlSession, jobpostNo);

		if (count > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}

		sqlSession.close();

		return count;
	}

	
	public ArrayList<JobPost> getPostsByCategory(String category) {
		
		//데이터베이스 연결 및 쿼리 실행
		SqlSession session = Template.getSqlSession();
		
		//반환된 결과를 ArrayList<Post> 형태로 변환하여 반환
		ArrayList<JobPost> list = dao.getPostsByCategory(session, category);
		
		session.close();
		
		return list;
	}


	public JobPost selectOne(int corpNo) {
		
		SqlSession session = Template.getSqlSession();

		JobPost selectOne = dao.selectOne(session, corpNo);

		session.close();
		return selectOne;
	}


	

	
}
