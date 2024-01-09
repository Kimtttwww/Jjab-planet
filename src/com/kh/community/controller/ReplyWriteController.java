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
import com.kh.member.service.NoticeService;
import com.kh.propose.service.ProposeService;

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
		Reply r = Reply.builder()
				.refNo(Integer.parseInt(request.getParameter("postNo")))
				.replyContent(request.getParameter("replyContent"))
				.replyWriter(((Member) request.getSession().getAttribute("loginUser")).getUserNo())
				.build();
		
		if(new PostService().insertReply(r) > 0) {
			response.getWriter().print(new NoticeService().insertNotice(Integer.parseInt(request.getParameter("postWriter")), 4));
		} else {
			response.getWriter().print(false);
		}
	}
}