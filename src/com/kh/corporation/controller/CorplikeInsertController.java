package com.kh.corporation.controller;

import java.io.IOException;
import java.util.HashMap;

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
		int corpCode = Integer.parseInt( request.getParameter("corpNo"));
		int userNo = Integer.parseInt( request.getParameter("userNo"));
		int corplike = 0;
		int corplikeCount = 0;
		
		HashMap<Integer, Integer> map = new HashMap<>();
		map.put(corpCode, userNo);
		System.out.println("corpCode, userNo : " +corpCode+ userNo);
		
		// 기업찜 누르면 JOAYO_CORP테이블에 insert하고 corp테이블에 count+1 update
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		System.out.println("cL loginUser : " +loginUser);
		
		
		// 1. 기업찜 누르면 JOAYO_CORP테이블에 insert
		if(loginUser == null) {
			
			request.setAttribute("alertMsg", "로그인 후 이용 가능합니다");
			response.sendRedirect(request.getContextPath() + "detail.corp");
			
		} else { 
			corplike = corpService.corplikeInsert(map);
			request.setAttribute("corplike", corplike);
			System.out.println("corplike : " +corplike);
		}
		
		// 2. corp테이블에 count+1 update
		if(corplike > 0) {
			corplikeCount = corpService.corplikeCount(corpCode);
			request.setAttribute("corplikeCount", corplikeCount);
			System.out.println("corplikeCount : " +corplikeCount);
					
		}else {
			request.setAttribute("alertMsg", "corp count+1 실패!");
			response.sendRedirect(request.getContextPath() + "detail.corp");
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
