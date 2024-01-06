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
@WebServlet("/change.pr")
public class ObjectChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObjectChangeController() {
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

		if(new PostService().deleteObject(type, refNo) > 0) {
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
		HashMap<String, String> v = new HashMap<String, String>();
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String type = request.getParameter("type");
		
		v.put("type", type);
		
		if(type.equals("P")) {
			v.put("refNo", String.valueOf(postNo));
			v.put("postTitle", request.getParameter("postTitle"));
			v.put("postContent", request.getParameter("postContent"));
		}
		
		if(type.equals("R")) {
			v.put("refNo", request.getParameter("replyNo"));
			v.put("replyContent", request.getParameter("replyContent"));
		}
		
		if(new PostService().updateObject(v) > 0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}
}