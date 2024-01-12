package com.kh.corporation.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.corporation.model.service.CorporationService;
import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;
import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class CorpMypageJobController
 */
@WebServlet("/mypage.me")
public class CorpMypageJobController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CorpMypageJobController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int corpCode = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		JobPostService jpService = new JobPostService();
		JobPost p = jpService.selectOne(corpCode);

		if (p != null) {
			String careerText = convertCareerToText(p.getCareer());
			String educationText = convertEducationToText(p.getEducation());
			String locationText = convertLocationToText(p.getLocation());
			p.setPhone(new MemberService().selectMember(p.getCorpNo()).getPhone());
			p.setCareer(careerText); // 변환된 텍스트로 다시 설정
			p.setEducation(educationText); // 변환된 텍스트로 다시 설정
			p.setLocation(locationText);
			request.setAttribute("p", p);
		}
		request.getRequestDispatcher("WEB-INF/views/corporation/jobPostinUpdate.jsp").forward(request, response);
	}
	private String convertLocationToText(String location) {
		switch (location) {
		case "1":
			return "서울";
		case "2":
			return "경기";
		case "3":
			return "인천";
		case "4":
			return "부산";
		default:
			return "지역미상";
		}
	}

	private String convertEducationToText(String career) {
		switch (career) {
		case "1":
			return "신입";
		case "2":
			return "3년 이상";
		case "3":
			return "5년 이상";
		case "4":
			return "7년 이상";
		case "5":
			return "10년 이상";
		default:
			return "경력 미상";
		}
	}

	private String convertCareerToText(String education) {
		switch (education) {
		case "1":
			return "고졸";
		case "2":
			return "초대졸";
		case "3":
			return "대졸 이상";
		default:
			return "학력 정보 없음";
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CorporationService cmpj = new CorporationService();
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");

		JobPost j = JobPost.builder().career(request.getParameter("career"))
				.education(request.getParameter("education")).endDate(Date.valueOf(request.getParameter("endDate")))
				.jobNo(request.getParameter("jobNo")).location(request.getParameter("location"))
				.phone(request.getParameter("phone")).postContent(request.getParameter("postContent"))
				.postTitle(request.getParameter("postTitle"))
				.corpNo(loginUser.getUserNo())
				.build();
		
//		이력서 공고가 없으면 등록완료로 하고, 있으면 공고 수정 완료로
		JobPost jobPost = new JobPostService().selectOne(loginUser.getUserNo()); 
		if (jobPost == null) {
			if (cmpj.insertPost(j)) {
				request.setAttribute("alertMsg", "공고 등록 완료");
				response.sendRedirect("notice.me");
			} else {
				request.setAttribute("alertMsg", "공고 등록이 안됩니다.");
				response.sendRedirect("mypage.job");
			}
		} else {
			if (cmpj.updateMyPageJobService(j)) {
				request.getSession().setAttribute("alertMsg", "공고 수정 완료.");
			} else {
				request.getSession().setAttribute("alertMsg", "공고가 수정 실패.");
			}
			response.sendRedirect("mypage.me");
		}
	}

}