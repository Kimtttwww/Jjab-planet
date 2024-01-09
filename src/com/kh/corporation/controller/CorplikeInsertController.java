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
 * Servlet implementation class CorpLikeController
 */
@WebServlet("/update.like.corp")
public class CorplikeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorplikeInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationService corpService = new CorporationService();
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		int corpCode = Integer.parseInt(request.getParameter("corpCode")) ;
		
		boolean isLiked = corpService.isCorpLiked(corpCode, userNo) ? true : false;
		
		if (isLiked) {
            // 이미 좋아요를 눌렀다면 좋아요 취소
            corpService.corplikeUnCount(corpCode);
            corpService.corplikeDelete(corpCode, userNo);
        } else {
            // 좋아요를 누르지 않았다면 좋아요 증가
            corpService.corplikeCount(corpCode);
            corpService.corplikeInsert(corpCode, userNo);
            corpService.noticelikeCorp(corpCode);
        }
		
        // 결과를 클라이언트에 전송
        response.getWriter().print(isLiked);
        
    }

		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
