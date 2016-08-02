package com.forum.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.TieDao;
import com.forum.pojo.Tie;
import com.forum.pojo.User;

/**
 * Servlet implementation class PostTieServlet
 */
@WebServlet("/PostTieServlet")
public class PostTieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostTieServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (null == user) {
			response.getWriter().append("failed,login");
		} else {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String style = request.getParameter("type");
			if (style.equals("c  ")) {
				style = "c++";
			} else if (style.equals("c")) {
				style = "c#";
			}
			String username = user.getuName();
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateS = format.format(date);
			Tie tie = new Tie();
			tie.settTitle(title);
			tie.settContent(content);
			tie.settDate(dateS);
			tie.settStyle(style);
			tie.settType("normal");
			tie.settUsername(username);
			TieDao dao = new TieDao();
			dao.addTie(tie);
			System.out.println("title:" + title);
			System.out.println("content:" + content + "type:" + style);
			request.getRequestDispatcher("TopicServlet").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
