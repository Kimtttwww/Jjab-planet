package com.kh.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.vo.Reply;
import com.kh.community.service.PostService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class PostWriteController
 */
@WebServlet("/write.re")
public class ReplyWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyWriteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int refNo = Integer.parseInt(request.getParameter("postNo"));
		String replyContent= request.getParameter("replyContent");
		int replyWriter = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		
		Reply r = Reply.builder()
				.refNo(refNo)
				.replyContent(replyContent)
				.replyWriter(replyWriter)
				.build();
		
		int result = new PostService().insertReply(r);
		
		if(result > 0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}
}