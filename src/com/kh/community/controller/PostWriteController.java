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
		/* 니증에 로그인 기능 되면 추가할 부분
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
		} else { 
			request.setAttribute("alertMsg", "로그인 후 이용 가능합니다");
			response.sendRedirect(request.getContextPath() + "list.po");
		}
		 */
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
			request.setAttribute("alertMsg", "게시글이 등록되었습니다");
		} else {
			request.setAttribute("alertMsg", "에러가 발생하였습니다");
		}
		response.sendRedirect(request.getContextPath() + "/list.bo");
	}
}