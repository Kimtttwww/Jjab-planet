package com.kh.propose.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;
import com.kh.propose.service.ProposeService;

@WebServlet("/applyForJob")
public class ApplyController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ApplyController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
    
    	if (loginUser != null) {
    	    // 이력서 존재 여부 확인
    	    boolean resumeExists = new ProposeService().checkResumeExists(loginUser.getUserNo());
    	    // 세션에 이력서 존재 여부 추가
    	    request.getSession().setAttribute("resumeExists", resumeExists);
    	}
    	
    	// 파라미터 추출
        int proposer = Integer.parseInt(request.getParameter("proposer"));
        int receiver = Integer.parseInt(request.getParameter("receiver"));
        String proposeType = request.getParameter("proposeType");

        // 서비스 객체 생성 및 메서드 호출
        ProposeService proposeService = new ProposeService();
        int result = proposeService.insertPropose(proposer, receiver, proposeType);

        if (result > 0) {
            // 성공 메시지와 함께 원하는 페이지로 리디렉트
            request.getSession().setAttribute("alertMsg", "성공적으로 지원했습니다.");
            response.sendRedirect(request.getContextPath() + "/detail.job"); // 원하는 페이지 경로 지정
        } else {
            // 실패 메시지와 함께 원하는 페이지로 리디렉트
            request.getSession().setAttribute("alertMsg", "지원에 실패했습니다.");
            response.sendRedirect(request.getContextPath() + "/detail.job"); // 에러 페이지 경로 지정
        }
    }
}
