package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.NoticeService;

/**
 * Servlet implementation class noticeDeleteController
 */
@WebServlet("/noticeDelete.me")
public class noticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int deleteNo = Integer.parseInt(request.getParameter("deletenotice"));
		System.out.println(deleteNo);
		NoticeService ns = new NoticeService();
		
		if(ns.deleteNotice(deleteNo) > 0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
		
		if(ns.deleteNotice(deleteNo) > 0) {
			request.setAttribute("alertMsg", "삭제 성공");
			response.sendRedirect(request.getContextPath() + "/notice.me");
		} else {
			request.setAttribute("alertMsg", "해당 게시글을 찾지 못하였습니다");
			response.sendRedirect(request.getContextPath() + "/notice.me");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		doGet(request, response);
	}

}
