package com.kh.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberService;
import com.kh.member.model.vo.Member;


@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getSession().getAttribute("loginUser"));
		request.getRequestDispatcher("WEB-INF/views/common/loginForm.jsp").forward(request, response);
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("userId", userId);
		login.put("userPwd", userPwd);
		// login 바궈야함
		Member loginUser = new MemberService().loginMember(login);		
		
		if(loginUser == null) { // 확인
			request.getSession().setAttribute("alertMsg", "로그인 실패");
			System.out.println("로그인 실패");
			
		}else {
			request.getSession().setAttribute("alertMsg", "로그인 성공");
			request.getSession().setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
		}
		
		response.sendRedirect(request.getContextPath());
	
	
	}

}
