package com.kh.jobpost.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.community.model.vo.Post;
import com.kh.community.service.PostService;
import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;

/**
 * Servlet implementation class JobPostCategotyController
 */
@WebServlet("/JobPostCategotyController")
public class JobPostCategotyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobPostCategotyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");

	    // 카테고리에 따라 DB에서 데이터를 가져옵니다. 이 예에서는 서비스와 DAO를 사용한다고 가정합니다.
	    JobPostService service = new JobPostService();
	    ArrayList<JobPost> posts = service.getPostsByCategory(category);

	    // 결과를 JSON 형태로 변환하여 응답합니다. (Gson 라이브러리 사용)
	    String json = new Gson().toJson(posts);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
