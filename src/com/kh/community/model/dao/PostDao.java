package com.kh.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Post;

public class PostDao {
	public int selectPostCount(SqlSession db, String category) {
		return db.selectOne("communityMapper.selectPostCount", category);
	}

	public ArrayList<Post> selectPostList(SqlSession db, PageInfo pi, String caterogy) {
		int limit = pi.getObjLimit();
		int offset = pi.getCurrentPage() - 1;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)db.selectList("communityMapper.selectPostList", caterogy, rowBounds);
	}
}