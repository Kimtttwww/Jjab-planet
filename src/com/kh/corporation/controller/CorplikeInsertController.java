package com.kh.corporation.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.corporation.model.service.CorporationService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CorpLikeController
 */
@WebServlet("/like.corp")
public class CorplikeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorplikeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CorporationService corpService = new CorporationService();
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int corpCode = Integer.parseInt( request.getParameter("corpNo"));
		int userNo = loginUser.getUserNo();
		
		
		boolean isLiked = corpService.isCorpLiked(corpCode, userNo);

        if (isLiked) {
            // 이미 좋아요를 눌렀다면 좋아요 취소
            corpService.corplikeUnCount(corpCode);
        } else {
            // 좋아요를 누르지 않았다면 좋아요 증가
            corpService.corplikeCount(corpCode);
        }

        // 결과를 클라이언트에 전송
        response.getWriter().print("성공@");
        
    }

		
		
		
		
		
//		if(corpService.corplikeInsert(corpCode, userNo) == 1) {
//		if(corpService.corplikeCount(corpCode) > 0) {	// 조회수 증가가 성공하면
//			// 
//				response.getWriter().print(true);
//				System.out.println("여기 들어옴d? count+1");
//				
//				
//			}else {
//					corpService.corplikeUnCount(corpCode);
//					corpService.corplikeDelete(corpCode, userNo);
//					
//					System.out.println("여기 들어옴d? count-1 @@");
//					response.getWriter().print(false);
//				}
//		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
