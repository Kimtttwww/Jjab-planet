package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Resume;
import com.kh.member.model.vo.Resume.ResumeBuilder;
import com.kh.member.service.ResumeDetailService;

/**
 * Servlet implementation class MemberResumeDetailController
 */
@WebServlet("/resume.me")
public class ResumeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResumeDetailService resumeService = new ResumeDetailService();
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
		int workerNo = (Integer.parseInt(request.getParameter("workerNo"))); //이력서 제목
		
		Resume resume = Resume.builder()
				.workerNo(workerNo)
				.formTitle(request.getParameter("formTitle"))
				.address(request.getParameter("address"))
				.jobName(request.getParameter("jobname"))
				.isOpen(request.getParameter("isOpen"))
				.education(request.getParameter("education"))
				.career(request.getParameter("career"))
				.build();
		
		Resume updateResume = new ResumeDetailService().updateResume(resume);
		
		if(updateResume==null) {
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다");	
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다");
			session.setAttribute("loginUser", updateResume);	// 같은 키값은 존재할 수 없다 = 덮어쓰기
		}
				
	}
}
