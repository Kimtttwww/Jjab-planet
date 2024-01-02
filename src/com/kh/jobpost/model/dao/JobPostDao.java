package com.kh.jobpost.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.jobpost.model.vo.JobPost;

public class JobPostDao {

	public JobPost detailBoard(SqlSession session, int jobpostNo) {
		return session.selectOne("post-mapper.detailPost", jobpostNo);
	}

	public ArrayList<JobPost> selectList(SqlSession session, PageInfo pi) {
		/*
		 * 마이바티스에서는 페이징 처리를 위해 RowBounds라는 클래스 제공한다.
		 * 
		 * * offset : 몇개의 게시글을 건너 뛰고 조회할건지에 대한 값
		 * 
		 * boardLimit가 5일 경우                   offset        limit
		 * currentPage : 1 => 1~5                  0             5
		 * currentPage : 2 => 6~10                 5             5
		 * currentPage : 3 => 11~15               10             5
		 * */
		
		int limit = pi.getObjLimit();
		int offset = pi.getCurrentPage()-1;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		/*
		 * RowBounds객체를 넘겨야 할 경우 selectList메서드의 오버로딩 메서드중
		 * 매개변수가 3개인 메소드를 사용해야만 한다.
		 * 
		 * 단, 이때 두번째 매개변수(쿼리문을 꾸밀 객체)가 필요 없다면 null값을 제시해야한다.
		 * */
		
		return (ArrayList) session.selectList("jobpostMapper.selectList",null,rowBounds);
	}

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("jobpostMapper.selectListCount");
	}

}