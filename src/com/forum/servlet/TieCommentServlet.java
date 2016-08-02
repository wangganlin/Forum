package com.forum.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.CommentDao;
import com.forum.pojo.Comment;

/**
 * Servlet implementation class TieCommentServlet
 */
@WebServlet("/TieCommentServlet")
public class TieCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TieCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tieComment = request.getParameter("tieComment");
		int tieId = Integer.parseInt(request.getParameter("tieId"));
		String username = request.getParameter("username");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		//String str=sdf.format(date);
		Date date = new Date();
		String tDate = sdf.format(date);
		
		CommentDao commentDao = new CommentDao();
		Comment comment = new Comment();
		comment.setcDate(tDate);
		comment.setcContent(tieComment);
		comment.setcUsername(username);
		comment.setTieId(tieId);
		commentDao.addComment(comment);
		System.out.println("Ìí¼Ó³É¹¦");
		response.sendRedirect("ViewTieServlet?id="+tieId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
