package com.kh.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.myPage.model.vo.Resume;

public class corMypageDao {
	public ArrayList<Resume> selectResumeList(SqlSession session, int userNo, PageInfo pi) {
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)session.selectList("corMyPageMapper.selectResumeList", userNo, rowBounds);
	}

	public int selectResumeListCount(SqlSession session, int userNo) {
		return session.selectOne("corMyPageMapper.selectResumeListCount", userNo);
	}
}