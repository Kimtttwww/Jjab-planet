package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;

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

		request.setAttribute("workerNo", workerNo); 
		request.setAttribute("resume", resumeService.ResumeDetail(workerNo)); 
		
		request.getRequestDispatcher("WEB-INF/views/member/memberResume.jsp").forward(request, response);
	}

	/**
	 * @see HttpServ
	 * 
	 * let#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int	workerNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		
		Resume resume = Resume.builder()
				.workerNo(workerNo)
				.workerName(request.getParameter("workerName"))
				.formTitle(request.getParameter("formTitle"))
				.address(request.getParameter("address"))
				.gender(request.getParameter("gender"))
				.jobNo(request.getParameter("jobNo"))
				.birthday(Date.valueOf(request.getParameter("birth")))
				.education(request.getParameter("education"))
				.career(request.getParameter("career"))
				.isOpen(request.getParameter("isOpen"))
				.build();
		
		System.out.println(resume);
		if(resumeService.ResumeDetail(workerNo) != null) {
			if (resumeService.updateResume(resume)) {
				request.getSession().setAttribute("alertMsg", "성공적으로 이력서를 수정했습니다");
			} else {
				request.getSession().setAttribute("alertMsg", "이력서 수정에 실패했습니다");
			}
		}else {
			if (resumeService.insertResume(resume)) {
				request.getSession().setAttribute("alertMsg", "성공적으로 이력서를 등록했습니다");
			} else {
				request.setAttribute("errorMsg", "이력서 추가에 실패했습니다");	
			}
		}
		response.sendRedirect("resume.me");
	}
}