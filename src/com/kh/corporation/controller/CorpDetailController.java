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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationService corpService = new CorporationService();
		int corpCode = Integer.parseInt( request.getParameter("corpNo"));
		int objCount = corpService.reviewCount(corpCode);		
		int pageLimit = 5;
		int objLimit = 4;
		
		int currentPage;
		String currentPageParam = request.getParameter("currentPage");

		if (currentPageParam != null && !currentPageParam.isEmpty()) {
		    currentPage = Integer.parseInt(currentPageParam);
		} else {
		    currentPage = 1; // 기본값 설정
		}
		
		PageInfo pi = Pagination.getPageInfo(objCount, currentPage, pageLimit, objLimit);
		request.setAttribute("pi", pi);
		
		// 모든 기업리스트
		List<Corporation> corpList = corpService.selectCorpList(pi);
		request.setAttribute("corpList", corpList);
		
		// corpNo에 해당하는 기업 출력
		Corporation corp = corpService.selectCorpOne(corpCode);
		request.setAttribute("corp", corp);
		
		// corpNo에 해당하는 기업로고
		List<Logo> logo = corpService.selectLogoOne(corpCode);
		request.setAttribute("logo", logo);
		
		// corpNo에 해당하는 채용공고 출력
		JobPost jobPost = corpService.selectJobPostList(corpCode);
		request.setAttribute("jobPost", jobPost);
		
		// corpNo에 해당하는 리뷰 리스트 출력하기
		List<Reply> reply = corpService.selectReviewList(pi, corpCode);
		request.setAttribute("reply", reply);
		
		request.getRequestDispatcher("/WEB-INF/views/corporation/corpInfo_detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}