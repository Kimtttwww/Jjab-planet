package com.kh.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.corporation.model.vo.Corporation;
import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/sign.bo")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/views/member/memberInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		INSERT INTO MEMBER(USER_NO, USER_ID, USER_PWD, PHONE, STATUS, USER_TYPE)
//		VALUES(SEQ_UNO.NEXTVAL, #{userId}, #{userPwd}, #{phone}, #{status}, #{userType})
		
		String userId = request.getParameter("userId") + "@" + request.getParameter("email-selectText");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("pphone") + request.getParameter("phone");
		String userType = request.getParameter("userType");
		Corporation c = null;
		
//		================================================================================
		
		Member m = Member.builder()
				.userId(userId)
				.userPwd(userPwd)
				.phone(phone)
				.userType(userType).build();
		
		System.out.println(m);
		
		
		if(userType.equals("C")){		
// 		=================================================================================
		String corpName = request.getParameter("corpName");
		String ceoName = request.getParameter("ceoName");
		String corpBn = request.getParameter("corpBn");
		String address = request.getParameter("address");
		String homePage = request.getParameter("homePage");
		
// 		=================================================================================		
		
		c = Corporation.builder()
				.corpName(corpName)
				.ceoName(ceoName)
				.corpBn(corpBn)
				.address(address)
				.homePage(homePage).build();
		System.out.println(c);
		
		
//		==================================================================================
		}
		
		int result = new MemberService().insertMember(m);
		if(userType.equals("C")) {		
			result *= new MemberService().insertMembera(c);
	}
		System.out.println(result);
		HttpSession session = request.getSession();


		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
//			NULL
		} else {
			session.setAttribute("alertMsg", "회원가입 실패");
			request.getRequestDispatcher(request.getContextPath() + "/sign.bo").forward(request, response);
			
		}
//		홈페이지 다시 돌아가기
	}
}
