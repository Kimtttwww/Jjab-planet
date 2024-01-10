package com.kh.jobpost.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;

/**
 * Servlet implementation class JobPostListController
 */
@WebServlet("/list.job")
public class JobPostListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobPostListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		JobPostService service = new JobPostService();
		
//		------페이징처리-------
		int objCount = service.selectListCount();
		int currentPage = 1;
	
		if (objCount > 0) {
			PageInfo pi = Pagination.getPageInfo(objCount, currentPage, 10, 5);
			ArrayList<JobPost> list = service.selectList(pi);
			
			request.setAttribute("pi", pi);      
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingList.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "게시글 상세조회 실패");
			response.sendRedirect("list.job");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	}
}