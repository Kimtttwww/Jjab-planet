package com.kh.corporation.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationService corpService = new CorporationService();
		String corpNoParameter = request.getParameter("corpNo");
		int corpCode = 0;
		
		if (corpNoParameter != null && !corpNoParameter.isEmpty()) {
		    try {
		        corpCode = Integer.parseInt(corpNoParameter);
		    } catch (NumberFormatException e) {
		      
		        e.printStackTrace(); 
		    }
		} else {
		    corpCode = 1000; // 기본값 설정
		}

		int objCount = corpService.corpCount();
		int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? 
							"1" : request.getParameter("currentPage"));
		int pageLimit = 5;
		int objLimit = 13;

		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, pageLimit, objLimit);
		
		List<Logo> logoList = corpService.selectLogoList(corpCode);
		request.setAttribute("logoList", logoList);

		// 기업 로고 list
		List<Corporation> Corplist = corpService.selectCorpList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("Corplist", Corplist);
		
		Collections.shuffle(Corplist);
		request.setAttribute("randonCorp", Corplist);

		request.getRequestDispatcher("WEB-INF/views/corporation/corpInfo_main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}