package com.kh.corporation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.model.vo.Reply;
import com.kh.community.service.PostService;
import com.kh.corporation.model.service.CorporationService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CorpReplyWriterController
 */
@WebServlet("/write.review")
public class CorpReplyWriterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpReplyWriterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CorporationService corpService = new CorporationService();
		Reply reply = Reply.builder()
				.refNo(Integer.parseInt(request.getParameter("postNo")))
				.replyContent(request.getParameter("replyContent"))
				.replyWriter(((Member) request.getSession().getAttribute("loginUser")).getUserNo())
				.build();
		
//		if(corpService.insertReply(reply) > 0) {
//			response.getWriter().print(true);
//		} else {
//			response.getWriter().print(false);
//		}
	}
	

}
