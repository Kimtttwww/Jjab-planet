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

	// 특정 사용자의 이력서 정보 조회
    public Resume selectResumeByUserNo(SqlSession session, int userNo) {
        return session.selectOne("mypageMapper.selectResumeByUserNo", userNo);
    }

    public boolean checkResumeExists(SqlSession session, int workerNo) {
    	return (int) session.selectOne("proposeMapper.checkResumeExists", workerNo) > 0;
	}
   

}