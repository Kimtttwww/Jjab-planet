package com.kh.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.InterestCorp;

public class InterestCorpDao {
	@SuppressWarnings("unchecked")
	public ArrayList<InterestCorp> selectList(SqlSession sqlSession, PageInfo pi, int userNo) {
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList) sqlSession.selectList("mypageMapper.interestCorpList", userNo, rowBounds);
	}

	public int selectListCount(SqlSession sqlSession, int userNo) {
		int re = sqlSession.selectOne("mypageMapper.interestCorpListCount", userNo);
		
		System.out.println(re + "asd");
		return re;
	}

}
