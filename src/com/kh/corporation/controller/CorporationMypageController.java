package com.kh.corporation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.myPage.model.vo.Resume;
import com.kh.myPage.service.corMyPageService;

/**
 * Servlet implementation class CorporationMypageController
 */
@WebServlet("/myPage.bo")
public class CorporationMypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CorporationMypageController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser"); // 로그인 유저의 세션을 가져온다

		ArrayList<Resume> cormypage = null;

		corMyPageService cmp = new corMyPageService();
		cormypage = cmp.selectResumeList(loginUser.getUserNo()); // 해당 기업번호의 지원한 이력서들

		request.setAttribute("cormypage", cormypage); // jsp로 보내는
		request.getRequestDispatcher("WEB-INF/views/member/mypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}