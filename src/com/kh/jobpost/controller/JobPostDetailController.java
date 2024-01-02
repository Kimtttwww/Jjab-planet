package com.kh.jobpost.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;

/**
 * Servlet implementation class JobPostDetailController
 */
@WebServlet("/detail.job")
public class JobPostDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobPostDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int jobpostNo = Integer.parseInt(request.getParameter("p"));
		
		JobPostService service = new JobPostService();
		
		int result = service.increaseCount(jobpostNo);
		
		HttpSession session =request.getSession();

		if (result > 0) {
			JobPost p = service.detailPost(jobpostNo);

			request.setAttribute("jobpostNo", jobpostNo);
		
			System.out.println(jobpostNo);
			request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingDetailCP.jsp").forward(request, response);
		} else {
			session.setAttribute("alertMsg", "게시글 상세조회 실패");
//			response.sendRedirect("list.job?currentPage=1");
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
