package com.kh.corporation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.vo.Reply;
import com.kh.corporation.model.service.CorporationService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CorpReplyWriterController
 */
@WebServlet("/insertReview.corp")
public class CorpInsertReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpInsertReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CorporationService corpService = new CorporationService();
		
		Reply review = Reply.builder()
				.refNo(Integer.parseInt(request.getParameter("corpNo")))
				.replyContent(request.getParameter("replyContent"))
				.replyWriter(((Member) request.getSession().getAttribute("loginUser")).getUserNo())
				.build();
		
		int corpCode = review.getRefNo();
		
		if(corpService.insertReview(review) > 0) {
			corpService.noticeReview(corpCode);
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	
	
	}
}
