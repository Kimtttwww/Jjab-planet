package com.kh.propose.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class ProposeDao {

		public boolean checkResumeExists(SqlSession session, int userNo) {
			return session.selectOne("proposeMapper.checkResumeExists", userNo);
		}

		// PROPOSE 테이블에 데이터 삽입
		public boolean insertPropose(SqlSession session, HashMap<String, String> h) {
			// MyBatis 쿼리 실행
			return session.insert("proposeMapper.insertPropose", h) > 0;
		}

}