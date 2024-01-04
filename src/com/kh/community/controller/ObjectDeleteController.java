package com.kh.community.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.community.service.PostService;

/**
 * Servlet implementation class ObjectDeleteController
 */
@WebServlet("/del.pr")
public class ObjectDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObjectDeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		int refNo = postNo;
				
		if(type.equals("R")) refNo = Integer.parseInt(request.getParameter("replyNo"));

		HashMap<String, String> v = new HashMap<String, String>();
		v.put("type", type);
		v.put("refNo", Integer.toString(refNo));
		
		int result = new PostService().deleteObject(v);
		
		if(result > 0) {
			if(type.equals("P")) {	// 게시글 삭제
				request.setAttribute("alertMsg", "게시글이 삭제되었습니다");
				request.getRequestDispatcher("list.po").forward(request, response);
			} if(type.equals("R")) {	// 댓글 삭제
				request.setAttribute("alertMsg", "댓글이 삭제되었습니다");
				request.getRequestDispatcher("detail.po?postNo=" + postNo).forward(request, response);
			}
		} else {
			request.setAttribute("alertMsg", ((type.equals("P")) ? "게시글" : "댓글") + " 삭제에 실패하였습니다");
			request.getRequestDispatcher("detail.po?postNo=" + postNo).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}