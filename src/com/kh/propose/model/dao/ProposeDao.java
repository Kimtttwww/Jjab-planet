package com.kh.propose.model.dao;

import org.apache.ibatis.session.SqlSession;

public class ProposeDao {

    public int insertPropose(SqlSession session, int proposer, int receiver, String proposeType) {
        

        int result = 0;
//         result = session.insert("proposeMapper.insertPropose", 파라미터);
        // 실제 쿼리 실행 로직 구현

        return result;
    }
}
