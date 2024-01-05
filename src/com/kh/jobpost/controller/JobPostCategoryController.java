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
        
        ArrayList<JobPost> list = jobPostService.getPostsByCategory(category);
        System.out.println(list);
        
        
        if ("F".equals(category)) {
            list = jobPostService.getPostsByCategory("F");
        } else if ("B".equals(category)) {
            list = jobPostService.getPostsByCategory("B");
        } else if ("S".equals(category)) {
            list = jobPostService.getPostsByCategory("S");
        } 
//        else {
//            // 기타/알 수 없는 카테고리의 경우 전체 리스트 또는 오류 페이지로 처리
//            list = jobPostService.getAllPosts();
//        }
   
        
        request.setAttribute("list", list);
        request.getRequestDispatcher("WEB-INF/views/jobPosting/jobPostingList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
