package com.kh.propose.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.propose.model.dao.ProposeDao;

public class ProposeService {

    private ProposeDao ProposeDao = new ProposeDao();

//    public boolean applyJob(int proposer, int receiver, String proposeType) {
//        SqlSession session = Template.getSqlSession();
//        
//        boolean result = false;
//        int insertResult = dao.insertPropose(session, proposer, receiver, proposeType);
//
//        if (insertResult > 0) {
//            session.commit();
//            result = true;
//        } else {
//            session.rollback();
//        }
//
//        session.close();
//        return result;
//    }
    //서비스 또는 DAO에서 이력서 존재 여부 확인:
    public boolean checkResumeExists(int userNo) {
        SqlSession session = Template.getSqlSession();
        try {
            boolean exists = ProposeDao.checkResumeExists(session, userNo);
            return exists;
        } finally {
            session.close();
        }
    }

    
    
    
    
    
    
 // 제안(지원) 추가
    public int insertPropose(int proposer, int receiver, String proposeType) {
        SqlSession session = Template.getSqlSession();
        int result = 0;

        try {
            if (ProposeDao.checkResumeExists(session, proposer)) {
                result = ProposeDao.insertPropose(session, proposer, receiver, proposeType);
            }
            if (result > 0) session.commit();
            else session.rollback();
        } catch (Exception e) {
            session.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return result;
    }
    
    
    
    
    
}
