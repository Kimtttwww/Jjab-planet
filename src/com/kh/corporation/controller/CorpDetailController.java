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
import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;
import com.kh.jobpost.model.vo.JobPost;

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
		int corpCode = Integer.parseInt( request.getParameter("corpNo"));
		
		
		// 기업리뷰 페이징처리
		int objCount = corpService.reviewCount(corpCode);		
		int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? 
				"1" : request.getParameter("currentPage"));		
		int pageLimit = 10;
		int objLimit = 3;
		
		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, pageLimit, objLimit);
		
		// 모든 기업리스트
		List<Corporation> corpList = corpService.selectCorpList(pi);
		request.setAttribute("corpList", corpList);
		System.out.println("corpList : " +corpList);
		
		
		// corpNo에 해당하는 기업 출력
		List<Corporation> corpOne = corpService.selectCorpOne(corpCode);
		System.out.println(corpOne);
		request.setAttribute("corpOne", corpOne);
		
		
		// corpNo에 해당하는 기업로고
		List<Logo> logoList = corpService.selectLogoOne(corpCode);
		request.setAttribute("logoList", logoList);
		System.out.println("logoList : " + logoList);
		
		System.out.println("2corpCode : " + corpCode);
		
		
		// corpNo에 해당하는 채용공고 출력
		List<JobPost> jobPostList = corpService.selectJobPostList(corpCode);
		System.out.println("jobPostList : " +jobPostList);
		request.setAttribute("jobPostList", jobPostList);
		
		
		
		// 기업의 리뷰 리스트 출력하기
		List<Reply> replyList = corpService.selectReviewList(pi, corpCode);
		System.out.println("replyList : " + replyList);
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
