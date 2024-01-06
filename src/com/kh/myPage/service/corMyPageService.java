package com.kh.myPage.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.myPage.model.dao.corMypageDao;
import com.kh.myPage.model.vo.Resume;

public class corMyPageService {

	public ArrayList<Resume> selectResumeList(int userNo) {
		
		corMypageDao dao = new corMypageDao();
		
		SqlSession session = Template.getSqlSession();
		
		ArrayList <Resume> cormypage = dao.selectResumeList(session, userNo);
		
		session.close();
		
		return cormypage;
		
	}

}
