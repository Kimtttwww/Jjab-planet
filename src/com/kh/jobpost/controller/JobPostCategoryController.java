package com.kh.jobpost.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jobpost.model.vo.JobPost;
import com.kh.jobpost.service.JobPostService;

@WebServlet("/JobPostListController")
public class JobPostCategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public JobPostCategoryController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category"); // 카테고리 value값들어오는곳
        JobPostService jobPostService = new JobPostService();
        
        request.setAttribute("category", category);
        request.setAttribute("list", jobPostService.getPostsByCategory(category));
        
        request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().print(true);
    }
}