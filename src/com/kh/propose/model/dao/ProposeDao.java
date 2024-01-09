package com.kh.propose.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class ProposeDao {

//	public int insertPropose(SqlSession session, int proposer, int receiver, String proposeType) {
//
//		// 파라미터 담을 Map 객체 생성
//		// 여러개의 파라미터 전달할땐 HashMap을 사용하는게 유용
//		Map<String, Object> params = new HashMap<>();
//		params.put("proposer", proposer); // 제안자 ID
//		params.put("receiver", receiver); // 수신자 ID
//		params.put("proposeType", proposeType); // 제안 유형
//
//		// Mybatis 쿼리실행
//		int result = 0;
//		result = session.insert("proposeMapper.insertPropose", params);
//		// 실제 쿼리 실행 로직 구현
//
//		return result;
//	}
	
/* @#@#@#@#@#경계선@#@#@#경계선@#@#@#@#@#@#@#@#@#@#@#경계선#@#@#@#@#@#@#@@#@#@#@#@3*/
	/* @#@#@@#@#@#경계선@#@#@#경계선@#@#@#경계선@#@#@#경계선@#@#@#경계선#@#@#@#@##@#@#@3*/
	
	
//	public class PreoposeDao {
		// 이력서 존재 여부 확인
		public boolean checkResumeExists(SqlSession session, int userNo) {
			return session.selectOne("proposeMapper.checkResumeExists", userNo);
		}

		// PROPOSE 테이블에 데이터 삽입
		public boolean insertPropose(SqlSession session, HashMap<String, String> h) {
			// MyBatis 쿼리 실행
			return session.insert("proposeMapper.insertPropose", h) > 0;
		}

//	}

}
