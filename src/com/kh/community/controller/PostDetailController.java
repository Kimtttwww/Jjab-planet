package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.service.PostService;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/detail.po")
public class PostDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService ps = new PostService();
		int postNo = 0;
		try {
			postNo = Integer.parseInt(request.getParameter("postNo"));
			
			if(postNo == 0) throw new NumberFormatException();
		} catch (NumberFormatException e) {
			request.setAttribute("alertMsg", "잘못된 접근입니다");
			
			request.getRequestDispatcher("/list.po").forward(request, response);
		}
		
		
		int result = ps.increaseCount(postNo);
		
		if(result > 0) {
			request.setAttribute("p", ps.selectPost(postNo));
			
			request.getRequestDispatcher("WEB-INF/views/community/detail.jsp").forward(request, response);
		} else {
			request.setAttribute("alertMsg", "해당 게시글을 찾지 못하였습니다");
			
			response.sendRedirect(request.getContextPath() + "/list.po");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}