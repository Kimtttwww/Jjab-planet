package com.kh.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Resume;

public class ResumeDao{
	public Resume detailPost(SqlSession session, int workerNo) {
		return session.selectOne("mypageMapper.detailResume", workerNo);
	}
}
