package com.kh.community.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
		PostService ps = new PostService();
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		int currentPage = 1;
		
		try {
			if(category == null) category = "A";
			if(keyword == null || keyword.equals("")) keyword = "NULLNULLNULLNULLNULL";
			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
		}
		
		HashMap<String, String> v = new HashMap<String, String>();
		v.put("category", category);
		v.put("keyword", keyword);
		
		int postcount = ps.selectPostCount(v);
		
		PageInfo pi = Pagination.getPageInfo(postcount, currentPage, 10, 25);
		ArrayList<Post> list = ps.selectPostList(pi, v);
		
		request.setAttribute("category", category);
		request.setAttribute("keyword", (keyword.equals("NULLNULLNULLNULLNULL")) ? "" : keyword);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("WEB-INF/views/community/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}