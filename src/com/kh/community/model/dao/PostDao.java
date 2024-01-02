package com.kh.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Post;

public class PostDao {
	private String map = "communityMapper.";
	
	public int selectPostCount(SqlSession db, String category) {
		return db.selectOne(map + "selectPostCount", category);
	}

	public ArrayList<Post> selectPostList(SqlSession db, PageInfo pi, String category) {
		int limit = pi.getObjLimit();
		int offset = pi.getCurrentPage() - 1;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)db.selectList(map + "selectPostList", category, rowBounds);
	}

	public int insertPost(SqlSession db, Post p) {
		return db.insert(map + "insertPost", p);
	}
}