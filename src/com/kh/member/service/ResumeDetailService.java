package com.kh.member.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.myPage.model.vo.Resume;
import com.kh.member.model.dao.ResumeDao;

public class ResumeDetailService {
	private ResumeDao dao = new ResumeDao();
	
	public Resume ResumeDetail(int workerNo) {
		SqlSession session = Template.getSqlSession();
		Resume resume = dao.detailPost(session, workerNo);
		session.close();
		return resume;
	}
	public boolean updateResume(Resume resume) {
		SqlSession session = Template.getSqlSession();
		boolean result = dao.updateResume(session, resume);
		
		if(result) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return result;
		
		
		
	}
	public boolean insertResume(Resume resume) {
		SqlSession session = Template.getSqlSession();
		boolean result = dao.insertResume(session, resume);
		
		if(result) {
			session.commit();
		} else {
			session.rollback();
		}
		
		session.close();
		return result;
	}
}