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
 * Servlet implementation class CorpUpdateReviewController
 */
@WebServlet("/updateReview.corp")
public class CorpUpdateReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpUpdateReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CorporationService corpService = new CorporationService();
		int refNo = Integer.parseInt(request.getParameter("corpNo"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int replyWriter = loginUser.getUserNo();
		
		
		if(corpService.updateReview(refNo, replyWriter) > 0) {
			request.getSession().setAttribute("alertMsg", "리뷰가 수정되었습니다.");
			response.getWriter().print(true);
		} else {
			request.getSession().setAttribute("alertMsg", "리뷰 수정에 실패했습니다.");
			response.getWriter().print(false);
		}
		response.sendRedirect("WEB-INF/views/corporation/corpInfo_detail.jsp");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
