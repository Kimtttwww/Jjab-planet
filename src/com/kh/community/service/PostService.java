package com.kh.community.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.common.Template;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.dao.PostDao;
import com.kh.community.model.vo.Post;
import com.kh.community.model.vo.Reply;

public class PostService {
	private PostDao dao = new PostDao();
	private SqlSession db = Template.getSqlSession();

	
	public int selectPostCount(HashMap<String, String> v) {
		return dao.selectPostCount(db, v);
	}

	public ArrayList<Post> selectPostList(PageInfo pi, HashMap<String, String> v) {
		ArrayList<Post> list = dao.selectPostList(db, pi, v);
		
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

	public int insertReply(Reply r) {
		int result = dao.insertReply(db, r);
		
		System.out.println("result ser" + result);
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result;
	}
}