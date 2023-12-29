//package com.kh.jobpost.controller;
//
//import java.io.IOException;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.kh.jobpost.model.vo.JobPostVo;
//import com.kh.jobpost.service.JobService;
//
///**
// * Servlet implementation class JobPostListController
// */
//@WebServlet("/list.job")
//public class JobPostListController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public JobPostListController() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		JobService service = new JobService();
//		
//		HttpSession session =request.getSession();
//		
//		JobPostVo jpl = new JobPostVo();
//		
//		
//		ArrayList<JobPostVo> list = service.selectList(jpl);
//		request.setAttribute("list", list);
//		
//		request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingList.jsp").forward(request, response);
//
//		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		
//		
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
