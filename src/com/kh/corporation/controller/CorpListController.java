package com.kh.corporation.controller;

import java.io.IOException;
import java.io.Reader;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.service.CorporationService;
import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;

/**
 * Servlet implementation class CorpReviewListController
 */
@WebServlet("/list.corp")
public class CorpListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CorpListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CorporationService corpService = new CorporationService();
		String corpNoParameter = request.getParameter("corpNo");
		int corpCode = 111;
		
		if (corpNoParameter != null && !corpNoParameter.isEmpty()) {
		    try {
		        corpCode = Integer.parseInt(corpNoParameter);
		    } catch (NumberFormatException e) {
		        // 적절한 예외 처리
		        e.printStackTrace(); // 또는 로깅 등
		    }
		} else {
		    // 적절한 기본값이나 오류 처리
		    corpCode = 100; // 예를 들어, 기본값 설정
		}
		System.out.println("corpCode : "  + corpCode);
		
		// ------------------------ 페이징처리 -----------------------
//		int objCount;	// 게시글 갯수
//		int currentPage;	// 현재 요청한 페이지
//		int pageLimit;	// 페이지바 하단에 보여질 페이징바의 페이지 최대 갯수
//		int objLimit;	// 한 페이지에 보여질 게시글의 최대 갯수

		int objCount = corpService.corpCount();
		int currentPage = Integer
				.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		int pageLimit = 5;
		int objLimit = 13;

		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, pageLimit, objLimit);
		
		
		List<Logo> logoList = corpService.selectLogoList(corpCode);
		request.setAttribute("logoList", logoList);
		System.out.println("listC logoList : " + logoList);
		
		
		// 기업 로고 list
//		List<Logo> logoList = corpService.selectLogoList(corpCode);
//		request.setAttribute("logoList", logoList);
//		System.out.println("logoList : " + logoList);

		
		List<Corporation> Corplist = corpService.selectCorpList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("Corplist", Corplist);
//		System.out.println("pi : " + pi);
		System.out.println("Corplist : " + Corplist);
		
		Collections.shuffle(Corplist);
		request.setAttribute("randonCorp", Corplist);

		
//		List<Reply> list = corpService.selectReviewList(corpCode);
//		System.out.println();



		request.getRequestDispatcher("WEB-INF/views/corporation/corpInfo_main.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
