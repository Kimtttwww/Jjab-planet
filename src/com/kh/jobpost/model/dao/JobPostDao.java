package com.kh.jobpost.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.jobpost.model.vo.JobPost;

public class JobPostDao {

	public JobPost detailBoard(SqlSession session, int jobpostNo) {
		return session.selectOne("jobpostMapper.detailPost", jobpostNo); 
	}
	
	
//	public JobPost detailPost(SqlSession session, int jobpostNo) {
//
//		// MyBatis의 selectOne 메서드를 사용하여 특정 jobpostNo에 해당하는
//        // 채용공고 상세 정보를 조회하고 반환
//        return session.selectOne("jobpostMapper.detailPost", jobpostNo); 
//	}
	
	/*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0**/
	/*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0**/
	
	
	public ArrayList<JobPost> selectList(SqlSession session, PageInfo pi){
			int limit = pi.getObjLimit();
			int offset = (pi.getCurrentPage()-1)*limit;
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return(ArrayList) session.selectList("jobpostMapper.selectList",null,rowBounds);
	}

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("jobpostMapper.selectListCount");
	}


	public int increaseCount(SqlSession sqlSession, int jobpostNo) {
		return sqlSession.update("jobpostMapper.increaseCount", jobpostNo);
	}


	public ArrayList<JobPost> idxSelectList(SqlSession session, PageInfo pi) {
		return(ArrayList) session.selectList("jobpostMapper.idx_selectList");
	}


	public ArrayList<JobPost> getPostsByCategory(SqlSession session, String category) {
		return  (ArrayList)session.selectList("jobpostMapper.getPostsByCategory", category);
	}




	


	
	
	
	
	
	
	
	
	
	
	
}