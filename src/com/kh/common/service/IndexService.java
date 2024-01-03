package com.kh.common.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.dao.IndexDao;
import com.kh.jobpost.model.vo.JobPost;

public class IndexService {
	private IndexDao dao = new IndexDao();
	private SqlSession session = Template.getSqlSession();

	public ArrayList<JobPost> selectfirstList() {
		ArrayList<JobPost> list = dao.selectfirstList(session);
		
		session.close();
		return list;
	}

	public ArrayList<JobPost> selectSecondList() {
		ArrayList<JobPost> list = dao.selectSecondList(session);
		
		session.close();
		return list;
	}

	public ArrayList<JobPost> selectThirdList() {
		ArrayList<JobPost> list = dao.selectThirdList(session);
		
		session.close();
		return list;
	}


}
