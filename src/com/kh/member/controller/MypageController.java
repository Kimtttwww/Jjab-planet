//package com.kh.member.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class MypageController
// */
//@WebServlet("/myPage.me")
//public class MypageController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public MypageController() {
//        super();
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("WEB-INF/views/member/mypage.jsp").forward(request, response);
//	}
//  
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}
//}
package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;
import com.kh.myPage.model.vo.Resume;
import com.kh.myPage.service.corMyPageService;

/**
 * Servlet implementation class CorporationMypageController
 */
@WebServlet("/corMyPage.me")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MypageController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser"); // 로그인 유저의 세션을 가져온다
		corMyPageService service = new corMyPageService();
		int objCount = service.selectResumeListCount(loginUser.getUserNo());
		int currentPage = 1;
		
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
		}

		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, 5, 3);
		ArrayList<Resume> cormypage = service.selectResumeList(loginUser.getUserNo(), pi); // 해당 기업번호의 지원한 이력서들

		request.setAttribute("pi", pi);
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