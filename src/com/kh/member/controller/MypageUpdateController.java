package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.corporation.model.service.CorporationService;
import com.kh.corporation.model.vo.Corporation;
import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class MypageUpdateController
 */
@WebServlet("/update.me")
public class MypageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		if(loginUser.getUserType().equals("C")) {
			request.setAttribute("C", new CorporationService().selectCorpOne(loginUser.getUserNo()).get(0)); 
		}
		
		request.getRequestDispatcher("WEB-INF/views/member/memberUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService ms = new MemberService();
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		Corporation c = null;
		String userType = (loginUser).getUserType();
		
		Member m = Member.builder()
				.userNo(loginUser.getUserNo())
				.phone(request.getParameter("phone"))
				.userType(userType).build();
		
		if(ms.updateMember(m)) {
			if(userType.equals("C")) {
				c = Corporation.builder()
						.corpNo(loginUser.getUserNo())
						.corpName(request.getParameter("corpName"))
						.ceoName(request.getParameter("ceoName"))
						.corpBn(request.getParameter("corpBn"))
						.address(request.getParameter("address"))
						.homePage(request.getParameter("homePage")).build();
			}
			
			if(!userType.equals("C") || ms.updateMember(c)) {
				request.getSession().setAttribute("alertMsg", "회원 정보가 변경되었습니다");
			} else {
				request.getSession().setAttribute("alertMsg", "회원 정보 변경에 실패했습니다");
			}
		} else {
			request.getSession().setAttribute("alertMsg", "회원 정보 변경에 실패했습니다");
		}
		response.sendRedirect("update.me");
	}
}