package com.kh.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.myPage.model.vo.Resume;

public class corMypageDao {
	public ArrayList<Resume> selectResumeList(SqlSession session, int userNo) {
		return (ArrayList)session.selectList("corMyPageMapper.selectResumeList", userNo);
	}
}