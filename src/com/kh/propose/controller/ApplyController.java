package com.kh.propose.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.member.service.NoticeService;
import com.kh.myPage.service.ResumeService;
import com.kh.propose.service.ProposeService;

@WebServlet("/applyForJob")
public class ApplyController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ApplyController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
    	int corpNo = Integer.parseInt(request.getParameter("corpNo"));
    	
    	if (new ResumeService().checkResumeExists(loginUser.getUserNo()) &&
    			new ProposeService().insertPropose(loginUser.getUserNo(), corpNo, "C")) {
    	    response.getWriter().print(new NoticeService().insertNotice(corpNo, 4));
    	} else {
    		response.getWriter().print(false);
    	}
    }
}
