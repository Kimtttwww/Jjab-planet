package com.kh.jobpost.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
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
}
