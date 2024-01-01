package com.kh.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Post;
import com.kh.community.service.PostService;

/**
 * Servlet implementation class PostListController
 */
@WebServlet("/list.po")
public class PostListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response, 0);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response, 1);
	}
	
	/**
	 * @param methud (0 : Get / 1 : Post)
	 */
	private void process(HttpServletRequest request, HttpServletResponse response, int methud) throws ServletException, IOException {
		PostService ps = new PostService();
		String category = request.getParameter("category");
		int currentPage = 1;
		
		try {
			if(category == null) category = "A";
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
		}
		
		int postcount = ps.selectPostCount(category);
		
		PageInfo pi = Pagination.getPageInfo(postcount, currentPage, 10, 25);
		ArrayList<Post> list = ps.selectPostList(pi, category);
		
		if(methud == 0) {
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("WEB-INF/views/community/list.jsp").forward(request, response);
		} else {
			
		}
	}
}