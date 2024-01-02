package com.kh.community.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.dao.PostDao;
import com.kh.community.model.vo.Post;

public class PostService {
	private PostDao dao = new PostDao();
	private SqlSession db = Template.getSqlSession();

	
	public int selectPostCount(String caterogy) {
		return dao.selectPostCount(db, caterogy);
	}

	public ArrayList<Post> selectPostList(PageInfo pi, String category) {
		ArrayList<Post> list = dao.selectPostList(db, pi, category);
		
		db.close();
		return list;
	}

	public int insertPost(Post p) {
		int result = dao.insertPost(db, p);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result;
	}

	public int increaseCount(int postNo) {
		int result = dao.increaseCount(db, postNo);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		return result;
	}

	public Post selectPost(int postNo) {
		Post p = dao.selectPost(db, postNo);
		
		db.close();
		return p;
	}
}