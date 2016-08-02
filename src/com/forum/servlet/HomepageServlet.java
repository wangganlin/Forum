package com.forum.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.TieDao;
import com.forum.dao.UserDao;
import com.forum.pojo.Tie;
import com.forum.pojo.User;

/**
 * Servlet implementation class HomepageServlet
 */
@WebServlet("/HomepageServlet")
public class HomepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomepageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		TieDao tieDao = new TieDao();
		UserDao userDao = new UserDao();
		List<Tie> jingList = new ArrayList<>();
		List<Tie> xinList = new ArrayList<>();
		List<User> userList = new ArrayList<>();
		jingList = tieDao.checkBetterTie();
		xinList = tieDao.checkNewTie();
		userList = userDao.paihangbang();
		request.setAttribute("jingList", jingList);
		request.setAttribute("xinList", xinList);
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("homepage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
