package com.kh.jobpost.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.dao.PostDao;
import com.kh.jobpost.model.dao.JobPostDao;
import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.model.vo.JobPostVo;

public class JobPostService {
	private JobPostDao dao = new JobPostDao();

	public JobPost detailPost(int jobpostNo) {
		SqlSession session = Template.getSqlSession();

		JobPost p = dao.detailBoard(session, jobpostNo);

		//간단한 조회이기때문에 트랜젝션 할 필요없어서 클로즈 하면됨
		session.close();
		return p;
	}
	
	
	
	public ArrayList<JobPostVo> selectList(PageInfo pi){
		SqlSession session = Template.getSqlSession();
		ArrayList<JobPostVo> list = JobPostDao.selectListCount(session, pi);
		session.close();
		return list;
	}


// 채용공고 총개수 조회
	public int selectListCount() {
		SqlSession sqlSession = Template.getSqlSession();
		int listCount = JobPostDao.selectListCount(sqlSession);
		sqlSession.close();
		return listCount;
		
	}
	
	
}
