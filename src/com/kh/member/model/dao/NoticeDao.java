package com.kh.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Notice;

public class NoticeDao {
	public ArrayList<Notice> selectList(SqlSession session, int userNo) {
		return (ArrayList) session.selectList("mypageMapper.noticeList", userNo);
	}

	public int noticeDelete(SqlSession sqlSession, int deleteNo) {
		
		return sqlSession.update("mypageMapper.deleteNotice", deleteNo);

	}
}
