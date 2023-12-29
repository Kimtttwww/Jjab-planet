package com.kh.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template {
	/**
	 * @return 새 DB연결 객체
	 */
	public static SqlSession getSqlSession() {
		SqlSession sqlSession = null;
		String resource = "/mybatis-config.xml";

		try {
			InputStream stream = Resources.getResourceAsStream(resource);

			SqlSessionFactory ssfb = new SqlSessionFactoryBuilder().build(stream);
			sqlSession = ssfb.openSession(false);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlSession;
	}
}