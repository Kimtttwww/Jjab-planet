package com.kh.corporation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.service.CorporationService;

/**
 * Servlet implementation class CorpReviewInsertController
 */
@WebServlet("/detail.corp")
public class CorpDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		CorporationService corpService = new CorporationService();
//		
		int corpCode = Integer.parseInt( request.getParameter("corpNo"));
//		
		
		int objCount = corpService.reviewCount(corpCode);		
		int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? 
				"1" : request.getParameter("currentPage"));		
		int pageLimit = 10;
		int objLimit = 5;
		
		CorporationService coprService = new CorporationService();
		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, pageLimit, objLimit);
		List<Reply> replyList = coprService.selectReviewList(pi, corpCode);
		System.out.println(replyList);
		request.setAttribute("replyList", replyList);
		
		request.getRequestDispatcher("/WEB-INF/views/corporation/corpInfo_detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ------------------------ 페이징처리 -----------------------
				
				
				
				
	}

}
