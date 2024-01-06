package com.kh.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Notice;

public class NoticeDao {
	public ArrayList<Notice> selectList(SqlSession session, int userNo) {
		return (ArrayList) session.selectList("mypageMapper.noticeList", userNo);
	}
}
