package com.kh.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Notice;

public class NoticeDao {
	private String map = "mypageMapper.";
	
	public ArrayList<Notice> selectList(SqlSession session, int userNo) {
		return (ArrayList) session.selectList(map + "noticeList", userNo);
	}

	public boolean insertNotice(SqlSession session, HashMap<String, Integer> h) {
		return session.insert(map + "insertNotice", h) > 0;
	}
}