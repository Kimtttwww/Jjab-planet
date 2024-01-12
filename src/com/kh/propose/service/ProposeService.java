package com.kh.propose.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.propose.model.dao.ProposeDao;

public class ProposeService {

    private ProposeDao ProposeDao = new ProposeDao();
    /** 서비스 또는 DAO에서 이력서 존재 여부 확인:
     * @param userNo
     * @return
     */
    public boolean checkResumeExists(int userNo) {
        SqlSession session = Template.getSqlSession();
        try {
            boolean exists = ProposeDao.checkResumeExists(session, userNo);
            return exists;
        } finally {
            session.close();
        }
    }
    
    /** 제안(지원) 추가
     * @param proposer
     * @param receiver
     * @param proposeType
     * @return
     */
    public boolean insertPropose(int proposer, int receiver, String proposeType) {
        SqlSession session = Template.getSqlSession();

        HashMap<String, String> h = new HashMap<String, String>();
        h.put("proposer", String.valueOf(proposer));
        h.put("receiver", String.valueOf(receiver));
        h.put("proposeType", proposeType);
        
        boolean result = ProposeDao.insertPropose(session, h);
        
        if (result) {
        	session.commit();
        } else {
        	session.rollback();
        }

        session.close();
        return result;
    }
    
    
    
    
    
}
