package com.kh.jobpost.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.model.vo.JobPostVo;

public class JobPostDao {

	public JobPost detailBoard(SqlSession session, int jobpostNo) {
		return session.selectOne("post-mapper.detailPost", jobpostNo);
	}
	
	
	/*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0**/
	/*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0*0**/
	
	
	public ArrayList<JobPostVo> selectList(SqlSession session, PageInfo pi){
			
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage()-1)*limit;
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return(ArrayList) session.selectList("jobpost-mapper.selectList",null,rowBounds);
	}


	public static int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("jobpost-mapper.selectListCount");
	}

}