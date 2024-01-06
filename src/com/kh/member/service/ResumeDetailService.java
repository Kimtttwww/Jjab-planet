package com.kh.member.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.member.model.vo.Resume;
import com.kh.member.model.dao.ResumeDao;

public class ResumeDetailService {
	private ResumeDao dao = new ResumeDao();
	
	public Resume ResumeDetail(int workerNo) {
		SqlSession session = Template.getSqlSession();
		Resume resume = dao.detailPost(session, workerNo);
		session.close();
		return resume;
	}
	public Resume updateResume(Resume resume) {
		// TODO Auto-generated method stub
		return null;
	}

}
