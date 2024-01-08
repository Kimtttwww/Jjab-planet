package com.kh.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.myPage.model.vo.Resume;

public class ResumeDao{
	public Resume detailPost(SqlSession session, int workerNo) {
		return session.selectOne("mypageMapper.detailResume", workerNo);
	}

	public boolean updateResume(SqlSession session, Resume resume) {
		return session.update("mypageMapper.updateResume", resume) > 0;
	}
}
