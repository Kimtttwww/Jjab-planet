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
public class IndexFirstController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexFirstController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IndexService service = new IndexService();
		
		ArrayList<JobPost> listFirst = service.selectfirstList();
		ArrayList<JobPost> listSecond = service.selectSecondList();
		ArrayList<JobPost> listThird = service.selectThirdList();
		
		request.setAttribute("listFirst", listFirst);
		request.setAttribute("listSecond", listSecond);
		request.setAttribute("listThird", listThird);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
