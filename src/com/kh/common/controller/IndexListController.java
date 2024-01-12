package com.kh.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.service.IndexService;
import com.kh.jobpost.model.vo.JobPost;

/**
 * Servlet implementation class IndexFirstController
 */
@WebServlet("/index.co")
public class IndexListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IndexService service = new IndexService();

		ArrayList<JobPost> first = service.selectFirstList();
		ArrayList<JobPost> second = service.selectSecondList();
		ArrayList<JobPost> third = service.selectThirdList();
		
		request.setAttribute("first", first);
		request.setAttribute("second", second);
		request.setAttribute("third", third);
		
		request.getRequestDispatcher("/WEB-INF/views/common/indexcontent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}