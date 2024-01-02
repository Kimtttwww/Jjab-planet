package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.vo.Post;
import com.kh.community.service.PostService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class PostWriteController
 */
@WebServlet("/write.po")
public class PostWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostWriteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/views/community/write.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postWriter = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		String postTitle = request.getParameter("postTitle");
		String postContent= request.getParameter("postContent");
		String category= request.getParameter("category");
		
		Post p = Post.builder()
				.postWriter(postWriter)
				.postTitle(postTitle)
				.postContent(postContent)
				.category(category)
				.build();
		
		int result = new PostService().insertPost(p);
		
		if(result > 0) {
			request.getRequestDispatcher("list.bo").forward(request, response);
		} else {
			
		}
	}
}