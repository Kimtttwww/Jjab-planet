package com.kh.myPage.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.member.model.dao.ResumeDao;
import com.kh.myPage.model.vo.Resume;

public class ResumeService {

    private ResumeDao dao = new ResumeDao();

    public Resume getResumeByUserNo(int userNo) {
        SqlSession session = Template.getSqlSession();
        
        Resume userResume = null;
        try {
            userResume = dao.selectResumeByUserNo(session, userNo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return userResume;
    }

	public boolean checkResumeExists(int userNo) {
		SqlSession session = Template.getSqlSession();
		
		boolean result= dao.checkResumeExists(session, userNo);
		
		session.close();
		return result;
	}
}