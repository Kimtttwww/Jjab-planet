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

	public boolean insertNotice(int receiverNo, int noticeType) {
		HashMap<String, Integer> h = new HashMap<String, Integer>();
		h.put("receiverNo", receiverNo);
		h.put("noticeType", noticeType);
		
		boolean result = dao.insertNotice(session, h);
		
		if (result) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return result;
	}

	public int deleteNotice(int deleteNo) {
		
		int result = dao.noticeDelete(session, deleteNo);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();
		return result;
	}
}