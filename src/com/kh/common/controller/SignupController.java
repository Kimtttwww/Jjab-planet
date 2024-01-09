package com.kh.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.JjapFileRenamePolicy;
import com.kh.corporation.model.vo.Corporation;
import com.kh.corporation.model.vo.Logo;
import com.kh.member.model.vo.Member;
import com.kh.member.service.MemberService;
import com.oreilly.servlet.MultipartRequest;

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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/views/member/memberInsert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MultipartRequest mr = new MultipartRequest(request, Logo.getRealPath(request), Logo.FILE_SIZE, "UTF-8", new JjapFileRenamePolicy());
		MemberService ms = new MemberService();
		Corporation c = null;
		String userId = null;
		String emailSelectText = mr.getParameter("email-selectText");
		
		if(emailSelectText.equals("directEmail")) {
			userId = mr.getParameter("userId") + "@" + mr.getParameter("email-text");
		} else {
			userId = mr.getParameter("userId") + "@" + emailSelectText;
		}
		
		if(ServletFileUpload.isMultipartContent(request)) {
			c = Corporation.builder()
					.corpName(mr.getParameter("corpName"))
					.ceoName(mr.getParameter("ceoName"))
					.corpBn(mr.getParameter("corpBn"))
					.address(mr.getParameter("address"))
					.homePage(mr.getParameter("homePage"))
					.logo(new Logo(0, 0, mr.getOriginalFileName("logo"), mr.getFilesystemName("logo")))
					.build();
		}
		
		String phone = mr.getParameter("pphone") + mr.getParameter("phone");
		Member m = Member.builder()
				.userId(userId)
				.userPwd(mr.getParameter("userPwd"))
				.phone(phone)
				.userType(mr.getParameter("userType")).build();
			
		if(ms.insertMember(m) &&
				(m.getUserType().equals("E") || ms.insertMember(c))) {
			request.getSession().setAttribute("alertMsg", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
		} else {
			request.getSession().setAttribute("alertMsg", "회원가입 실패");
			response.sendRedirect(request.getContextPath() + "/sign.bo");
		}
	}
}