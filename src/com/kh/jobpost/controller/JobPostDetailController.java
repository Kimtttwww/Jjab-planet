package com.kh.jobpost.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.corporation.model.service.CorporationService;
import com.kh.corporation.model.vo.Corporation;
import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;
import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class JobPostDetailController
 */
@WebServlet("/detail.job")
public class JobPostDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public JobPostDetailController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JobPostService jobPostservice = new JobPostService();
        int jobpostNo = Integer.parseInt(request.getParameter("bno"));

        if (jobPostservice.increaseCount(jobpostNo) > 0) {
            JobPost p = jobPostservice.detailPost(jobpostNo);
            
//            List<Corporation> arr -> Corporation arr로 변경함 -다연
            Corporation arr = new CorporationService().selectCorpOne(p.getCorpNo());
//            Corporation c = arr.get(0);
            
//            p.setCorpName(c.getCorpName());
//            p.setCeoName(c.getCeoName());
            p.setPhone(new MemberService().selectMember(p.getCorpNo()).getPhone());
            
            String careerText = convertCareerToText(p.getCareer());
            p.setCareer(careerText); // 변환된 텍스트로 다시 설정
            
            String educationText = convertEducationToText(p.getEducation());
            p.setEducation(educationText); // 변환된 텍스트로 다시 설정
            
            String locationText = convertLocationToText(p.getLocation());
            p.setLocation(locationText);
            
         // 사용자의 userType 결정
            Member m = (Member) request.getSession().getAttribute("loginUser");
            String userType = null;
            if (m != null) {
                userType = m.getUserType();
            }
            p.setUserType(userType);
            
            

            request.setAttribute("p", p);
            request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingDetailUser2.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("alertMsg", "게시글 상세조회 실패");
            response.sendRedirect("list.job?currentPage=1");
        }
    }

    

	private String convertLocationToText(String location) {
		switch(location) {
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

	private String convertCareerToText(String career) {
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
    
    private String convertEducationToText(String education) {
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
    
    
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
