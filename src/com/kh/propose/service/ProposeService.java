package com.kh.propose.service;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.propose.model.dao.ProposeDao;

public class ProposeService {

    private ProposeDao dao = new ProposeDao();

    public boolean applyJob(int proposer, int receiver, String proposeType) {
        SqlSession session = Template.getSqlSession();
        
        boolean result = false;
        int insertResult = dao.insertPropose(session, proposer, receiver, proposeType);

        if (insertResult > 0) {
            session.commit();
            result = true;
        } else {
            session.rollback();
        }

        session.close();
        return result;
    }
}
