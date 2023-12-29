package com.kh.jobpost.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.jobpost.model.vo.JobPost;

public class PostDao {

	public JobPost detailBoard(SqlSession session, int jobpostNo) {
		return session.selectOne("post-mapper.detailPost", jobpostNo);
	}

}