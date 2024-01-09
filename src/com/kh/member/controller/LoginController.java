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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/views/common/loginForm.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("userId", userId);
		login.put("userPwd", userPwd);
		
		Member loginUser = new MemberService().loginMember(login);		
		
		if(loginUser != null && loginUser.getUserNo() > 0) { // 확인
			request.getSession().setAttribute("loginUser", loginUser);
			response.getWriter().print(true);
		}else {
			response.getWriter().print(false);
		}
	}
}