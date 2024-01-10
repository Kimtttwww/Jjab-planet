package com.kh.myPage.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import static com.kh.common.Template.*;
import com.kh.common.model.vo.PageInfo;
import com.kh.myPage.model.dao.corMypageDao;
import com.kh.myPage.model.vo.Resume;

public class corMyPageService {
	corMypageDao dao = new corMypageDao();
	SqlSession session = getSqlSession();
	
	public ArrayList<Resume> selectResumeList(int userNo, PageInfo pi) {
		ArrayList <Resume> cormypage = dao.selectResumeList(session, userNo, pi);
		
		session.close();
		return cormypage;
	}

	public int selectResumeListCount(int userNo) {
		return dao.selectResumeListCount(session, userNo);
	}
}