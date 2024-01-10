package com.kh.jobpost.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.Pagination;
import com.kh.common.model.vo.PageInfo;
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
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");

		int currentPage = 1;
		try {
			if (category == null || category.equals("")) {category = "A";}
			if (keyword == null || keyword.equals("")) {keyword = "NULLNULLNULLNULLNULL";}
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
		}
	
		int objCount = service.selectListCount(category, keyword);
		if (objCount > 0) { //조회된 공고가있으면 페이지정보를 생성, 없으면 오류
			PageInfo pi = Pagination.getPageInfo(objCount, currentPage, 10, 9);
			
			request.setAttribute("pi", pi);
			request.setAttribute("category", (category.equals("A") ? "" : category));
			request.setAttribute("keyword", (keyword.equals("NULLNULLNULLNULLNULL") ? "" : keyword));
			request.setAttribute("list", service.selectList(pi, category, keyword));
			
			request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingList.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "해당기업이 없습니다.");
			response.sendRedirect("list.job");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	}
}