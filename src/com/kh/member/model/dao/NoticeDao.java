package com.kh.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.member.model.vo.Notice;

public class NoticeDao {

	public ArrayList<Notice> selectList(SqlSession session, int userNo) {
		return (ArrayList) session.selectList("noticeMapper.noticeList", userNo);
	}


}
