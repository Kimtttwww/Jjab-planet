package com.kh.jobpost.service;

import java.util.ArrayList;

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

	public ArrayList<JobPost> selectList(PageInfo pi) {
		SqlSession session = Template.getSqlSession();

		ArrayList<JobPost> list = dao.selectList(session, pi);
		
		return list;
	}

	public int selectListCount() {
		SqlSession sqlSession = Template.getSqlSession();

		int listCount = dao.selectListCount(sqlSession);

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
}
