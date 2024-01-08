package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.member.service.ResumeDetailService;
import com.kh.myPage.model.vo.Resume;

/**
 * Servlet implementation class MemberResumeDetailController
 */
@WebServlet("/resume.me")
public class ResumeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResumeDetailService resumeService = new ResumeDetailService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeDetailController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workerNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();

		Resume resume = resumeService.ResumeDetail(workerNo);
		
		request.setAttribute("resume", resume); 
		request.setAttribute("workerNo", workerNo); 
		
		request.getRequestDispatcher("WEB-INF/views/member/memberResume.jsp").forward(request, response);
	}

	/**
	 * @see HttpServ
	 * 
	 * let#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ResumeDetailService ds = new ResumeDetailService();
		int workerNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		System.out.println(workerNo);
		
		
		Resume resume = Resume.builder()
				.workerNo(workerNo)
				.formTitle(request.getParameter("formTitle"))
				.address(request.getParameter("address"))
//				.jobName(request.getParameter("jobname"))
				.isOpen(request.getParameter("isOpen"))
				.education(request.getParameter("education"))
				.career(request.getParameter("career"))
				.build();
		
		boolean isUpdateSuccessful = resumeService.updateResume(resume);
		System.out.println(isUpdateSuccessful);
		System.out.println(resume);
		
		
		if(isUpdateSuccessful) {
			request.getSession().setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다");
		}else {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다");	
		}
		response.sendRedirect("resume.me");
	}
}