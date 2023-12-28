package com.kh.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.service.MemberServiceImpl;
import com.kh.member.model.vo.Member;


@WebServlet("/login.me")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/views/common/loginForm.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		String userPwd = request.getParameter("userPwd");
		System.out.println(userPwd);
		
		HashMap<String, String> asdf = new HashMap<String, String>();
		asdf.put("userId", userId);
		asdf.put("userPwd", userPwd);
		
		Member loginUser = new MemberServiceImpl().loginMember(asdf);		
		
		if(loginUser == null) { // 확인
			request.getSession().setAttribute("alertMsg", "로그인 실패");
			System.out.println("로그인 실패");
		}else {
			request.getSession().setAttribute("loginUser", loginUser);
			request.getSession().setAttribute("alertMsg", "로그인 성공");
			System.out.println(loginUser);
		}
		
		response.sendRedirect(request.getContextPath());
	}

}
