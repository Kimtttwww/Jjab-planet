package com.kh.jobpost.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jobpost.service.JobService;

/*박윤비 기업 공고 상세페이지 제작중 미완성 12:18*/
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
		JobService service = new JobService();
		
//		int result = service.increaseCount(boardNo); // 반환되는 결과값 보드의 개수result 에 담는다
		HttpSession session =request.getSession();
		
//		if (result > 0) {
//			// 게시글 정보 조회
//			//job
//			Board b = service.detailBoard(boardNo);
//
//			//request에 데이터 추가
//			request.setAttribute("b", b);
//			
//			System.out.println(b);
//			request.getRequestDispatcher("WEB-INF/views/board/boardDetailView.jsp").forward(request, response);
//		} else {
//			session.setAttribute("alertMsg", "게시글 상세조회 실패");
//			response.sendRedirect("list.bo?currentPage=1");
//		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
