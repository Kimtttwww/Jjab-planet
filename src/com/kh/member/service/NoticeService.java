package com.kh.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.member.model.dao.NoticeDao;
import com.kh.member.model.vo.Notice;

public class NoticeService {
	NoticeDao dao = new NoticeDao();
	SqlSession session = Template.getSqlSession();

	public ArrayList<Notice> selectList(int userNo) {
		ArrayList<Notice> notice = dao.selectList(session, userNo);
		
		session.close();
		return notice;
	}

	public int deleteNotice(int deleteNo) {
		
		SqlSession sqlSession = Template.getSqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("deleteNo", deleteNo);
		
		int result = dao.noticeDelete(sqlSession, deleteNo);
		
		if(result > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return result;
	}



}
