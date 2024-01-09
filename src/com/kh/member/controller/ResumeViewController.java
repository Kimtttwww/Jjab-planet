package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.ResumeDetailService;
import com.kh.myPage.model.vo.Resume;

/**
 * Servlet implementation class ResumeViewController
 */
@WebServlet("/resumeview.me")
public class ResumeViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		ResumeDetailService resumeService = new ResumeDetailService();
		int workerNo = Integer.parseInt(request.getParameter("bno")); // 뒤에 물음표 값을 1;1 식으로 하면 key = value 
		
		Resume resume = resumeService.ResumeDetail(workerNo);
		
		request.setAttribute("resume", resume);
		request.setAttribute("workerNo", workerNo);
		
		request.getRequestDispatcher("WEB-INF/views/member/memberResumeView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

}
