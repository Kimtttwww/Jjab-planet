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

	/**
	 * @param category = 게시글 필터(A, I, C, S / 없으면 "A" 넣어야 함)
	 * @param keyword = 검색어(없으면 "NULLNULLNULLNULLNULL" 넣어야 함)
	 * @return 전체 게시글 수
	 */
	public int selectPostCount(String category, String keyword) {
		HashMap<String, String> v = new HashMap<String, String>();
		v.put("category", category);
		v.put("keyword", keyword);
		
		return dao.selectPostCount(db, v);
	}

	/**
	 * @param pi = PageInfo 객체
	 * @param category = 게시글 필터(A, I, C, S / 없으면 "A" 넣어야 함)
	 * @param keyword = 검색어(없으면 "NULLNULLNULLNULLNULL" 넣어야 함)
	 * @return 조회된 게시글들
	 */
	public ArrayList<Post> selectPostList(PageInfo pi, String category, String keyword) {
		HashMap<String, String> v = new HashMap<String, String>();
		v.put("category", category);
		v.put("keyword", keyword);
		
		ArrayList<Post> list = dao.selectPostList(db, pi, v);
		
		db.close();
		return list;
	}

	/**
	 * @param p = 등록될 내용을 담은 Post 객체
	 * @return 등록 처리 여부
	 */
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

	/**
	 * @param postNo = 조회수를 증가시킬 게시글 번호
	 * @return 조회수 증가 처리 여부 
	 */
	public int increaseCount(int postNo) {
		int result = dao.increaseCount(db, postNo);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		return result;
	}

	/**
	 * @param postNo = 가져올 게시글 번호
	 * @return 조회된 게시글 객체
	 */
	public Post selectPost(int postNo) {
		Post p = dao.selectPost(db, postNo);
		
		db.close();
		return p;
	}

	/**
	 * @param r = 등록될 내용을 담은 Reply 객체
	 * @return 등록 처리 여부
	 */
	public int insertReply(Reply r) {
		int result = dao.insertReply(db, r);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result;
	}

	/**
	 * @param type = 게시글 / 댓글 유형(P / R)
	 * @param refNo = 게시글 / 댓글 번호
	 * @return 삭제 처리 여부
	 */
	public int deleteObject(String type, int refNo) {
		HashMap<String, String> v = new HashMap<String, String>();
		v.put("type", type);
		v.put("refNo", Integer.toString(refNo));
		
		int result = dao.deleteObject(db, v);
				
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result;
	}

	/**
	 * @param v = 게시글 / 댓글 수정에 필요한 정보 
	 * <pre>공통
	 *   type = 게시글 / 댓글 유형(P / R)
	 *게시글(type == P)
	 *   refNo = 게시글 번호
	 *   postTitle = 게시글 제목
	 *   postContent = 게시글 내용
	 *댓글(type == R)
	 *   replyNo = 댓글 번호
	 *   replyContent = 댓글 내용</pre>
	 * @return 수정 처리 여부
	 */
	public int updateObject(HashMap<String, String> v) {
		int result = dao.updateObject(db, v);
		
		if(result > 0) {
			db.commit();
		} else {
			db.rollback();
		}
		
		db.close();
		return result;
	}
}