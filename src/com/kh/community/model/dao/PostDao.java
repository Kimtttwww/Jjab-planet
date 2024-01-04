package com.kh.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Post;
import com.kh.community.model.vo.Reply;

public class PostDao {
	private String map = "communityMapper.";
	
	
	public int selectPostCount(SqlSession db, HashMap<String, String> v) {
		return db.selectOne(map + "selectPostCount", v);
	}

	public ArrayList<Post> selectPostList(SqlSession db, PageInfo pi, HashMap<String, String> v) {
		int limit = pi.getObjLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)db.selectList(map + "selectPostList", v, rowBounds);
	}

	public int insertPost(SqlSession db, Post p) {
		return db.insert(map + "insertPost", p);
	}

	public int increaseCount(SqlSession db, int postNo) {
		return db.update(map + "increaseCount", postNo);
	}

	public Post selectPost(SqlSession db, int postNo) {
		return db.selectOne(map + "selectPost", postNo);
	}

	public int insertReply(SqlSession db, Reply r) {
		return db.insert(map + "insertReply", r);
	}

	public int deleteObject(SqlSession db, HashMap<String, String> v) {
		return db.delete(map + "deleteObject", v);
	}
}