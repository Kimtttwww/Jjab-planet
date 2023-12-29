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

	public ArrayList<Post> selectPostList(PageInfo pi, String caterogy) {
		ArrayList<Post> list = dao.selectPostList(db, pi, caterogy);
				
		db.close();
		return list;
	}
}