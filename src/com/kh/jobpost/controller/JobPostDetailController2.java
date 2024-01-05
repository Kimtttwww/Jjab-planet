package com.kh.jobpost.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;

/**
 * Servlet implementation class JobPostDetailController2
 */
@WebServlet("/JobPostDetailController2")
public class JobPostDetailController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobPostDetailController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//채용공고 상세정보조회 로직
		//채용공고 고유번호 저장, http요청에서 받은 데이터가 문자열형태여서 정수로변환, http요청에서 특정 파라미터의 값(postNo) 가져오기 postNo는 사용자가 클릭한 채용공고의 고유번호
		int jobpostNo = Integer.parseInt(request.getParameter("jobpostNo")); 
		JobPostService jobPostService = new JobPostService(); 
		// JobPost타입의 jobPost변수선언->채용공고상세정보담는데사용,postNo(채용공고 고유번호)를 인자로전달,이메서드는 해당번호의 채용공고상세정보를 반환
		JobPost jobPost = jobPostService.detailPost(jobpostNo);
		
		//request객체에 특정속성추가 이속성은 JSP페이지에서 사용됨, 첫번째인자는 속성이름(변수명),두번째인자는 실제채용공고객체(변수)
		request.setAttribute("jobPost", jobPost);
		
		// 사용자 유형 확인
		//사용자 유형 저장, 세션에서 USER_TYPE속성 가져옴,getAttribute는 속성값 반환 여기서는 USER_TYPE값을 가져온다
		String userType = (String)request.getSession().getAttribute("USER_TYPE");
		
		// 사용자 유형에 따른 페이지 이동
		if("E".equals(userType)) {
			//구직자 (HTTP요청을 JSP페이지로 전달하는 과정), request객체:클라이언트 요청정보담음,response객체:클라이언트에게 보낼응답정보담음
			//forward호출을 통해 두객체가 jsp로 전달된
			request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingDetailUser2.jsp").forward(request, response);
		}else if("C".equals(userType)) {
			//기업
			request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingDetailUser2.jsp").forward(request, response);
		}else {
	        // 사용자 유형이 설정되지 않은 경우
	        response.sendRedirect("WEB-INF/views/jobPosting/jobPostingDetailUser2.jsp");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
