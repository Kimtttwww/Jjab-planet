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
import com.kh.member.model.vo.JoayoCorp;
import com.kh.member.model.vo.Member;
import com.kh.member.service.InterestCorpService;

/**
 * Servlet implementation class InterestingCorpListController
 */
@WebServlet("/list.co")
public class InterestCorpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InterestCorpListController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		InterestCorpService icService = new InterestCorpService();
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int objCount = icService.selectListCount(userNo);
		int currentPage = 1;
		int pageLimit = 10;
		int objLimit = 5;

		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, pageLimit, objLimit);
		
		ArrayList<JoayoCorp> list = icService.selectList(pi, userNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("WEB-INF/views/member/joayo_corp.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}