package com.kh.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.myPage.model.vo.Resume;

public class ResumeDao{
	public Resume detailPost(SqlSession session, int workerNo) {
		return session.selectOne("mypageMapper.detailResume", workerNo);
	}
	// 특정 사용자의 이력서 정보 조회
    public Resume selectResumeByUserNo(SqlSession session, int userNo) {
        return session.selectOne("mypageMapper.selectResumeByUserNo", userNo);
    }

}
