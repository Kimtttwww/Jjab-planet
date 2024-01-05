package com.kh.member.service;

import java.util.ArrayList;

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



}
