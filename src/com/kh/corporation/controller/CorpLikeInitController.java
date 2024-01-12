package com.kh.corporation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.corporation.model.service.CorporationService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CorpLikeInitController
 */
@WebServlet("/init.like.corp")
public class CorpLikeInitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpLikeInitController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationService corpService = new CorporationService();
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		if (loginUser != null) {
			int corpCode = Integer.parseInt(request.getParameter("corpCode")) ;
			int userNo = loginUser.getUserNo();
			
			boolean isLiked = corpService.isCorpLiked(corpCode, userNo) ? true : false;
			
	        // 결과를 클라이언트에 전송
	        response.getWriter().print(true);
		} else { 
			response.getWriter().print(false);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}