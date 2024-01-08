package com.kh.propose.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.propose.service.ProposeService;

/**
 * Servlet implementation class ApplyController
 */
@WebServlet("/applyForJob")
public class ApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼 데이터 수신
		int proposer = Integer.parseInt(request.getParameter("proposer"));
		int receiver = Integer.parseInt(request.getParameter("receiver"));
		String proposeType = request.getParameter("proposeType");
		
		// Propose 서비스를 이용하여 데이터베이스에 저장
		ProposeService proposeService = new ProposeService();
		boolean isApplied = proposeService.applyJob(proposer, receiver, proposeType);
		
		// 결과에 따라 적절한 응답 생성
		if (isApplied) {
			// 성공 메시지 설정 및 페이지 리디렉션
			request.getSession().setAttribute("alertMsg", "성공적으로 지원하였습니다.");
			response.sendRedirect("jobPostingDetailUser2.jsp"); // 혹은 적절한 페이지로 리디렉션
		} else {
			// 실패 메시지 설정 및 이전 페이지로 리디렉션
			request.getSession().setAttribute("alertMsg", "지원에 실패하였습니다.");
			response.sendRedirect("jobPostingDetailUser2.jsp"); // 혹은 적절한 페이지로 리디렉션
		}
	}

}
