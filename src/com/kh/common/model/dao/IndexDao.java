package com.kh.common.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.jobpost.model.vo.JobPost;

public class IndexDao {

	public ArrayList<JobPost> selectfirstList(SqlSession session) {
		return (ArrayList) session.selectList("jobpostMapper.idx_firstList");
	}

	public ArrayList<JobPost> selectSecondList(SqlSession session) {
		return (ArrayList)session.selectList("jobpostMapper.idx_secondList");
	}

	public ArrayList<JobPost> selectThirdList(SqlSession session) {
		return (ArrayList)session.selectList("jobpostMapper.idx_thirdList");
	}

}
