package com.kh.corporation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CorpReviewListController
 */
@WebServlet("/review.list")
public class CorpReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// ------------------------ 페이징처리 -----------------------
		int listCount;	// 게시글 갯수
		int currentPage;	// 현재 요청한 페이지
		int pageLimit;	// 페이지바 하단에 보여질 페이징바의 페이지 최대 갯수
		int boardLimit;	// 한 페이지에 보여질 게시글의 최대 갯수
		
		int maxPage;	// 가장 마지막 페이지가 몇번 페이지인지(총 페이지 수)
		int startPage;	// 페이지 하단에 보여질 페이징바의 시작수
		int endPage;	// 페이징 하단에 보여질 페이징바의 끝수
				
		// * listCount : 총 개시글 갯수
//		listCount = new BoardService().selectListCount();
		
		// * currentPage : 사용자가 요청한 페이지 -> 처음엔 선택한 값이 없기때문에(null) 1번으로 기본값설정함
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? 
				"1" : request.getParameter("currentPage"));
		
		// * pageLimit : 한 페이지에 보여질 페이징바의 최대개수
		pageLimit = 5;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대개수
		boardLimit = 3;
		
		
		// * maxPage : 가장 마지막 페이지가 몇번 페이지인지(총 페이지 수)		
//		maxPage = (int)Math.ceil( (double)listCount / boardLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이징 하단에 보여질 페이징바의 끝수
		endPage = startPage + pageLimit - 1;
		
//		if(endPage > maxPage) {
//			// endPage가 maxPage보다 많으면 안됨!!
//			endPage = maxPage;
//		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
