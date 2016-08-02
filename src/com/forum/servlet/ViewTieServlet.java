package com.forum.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.CommentDao;
import com.forum.dao.HuifuDao;
import com.forum.dao.TieDao;
import com.forum.dao.UserDao;
import com.forum.pojo.Comment;
import com.forum.pojo.Huifu;
import com.forum.pojo.Tie;
import com.forum.pojo.User;

/**
 * Servlet implementation class ViewTieServlet
 */
@WebServlet("/ViewTieServlet")
public class ViewTieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewTieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String tStyle = request.getParameter("style");
		TieDao tieDao = new TieDao();
		UserDao userDao = new UserDao();
		CommentDao commentDao = new CommentDao();
		HuifuDao huifuDao = new HuifuDao();
		Tie tie = new Tie();
		User user1 = new User();
		List<Comment> commentList = new ArrayList<>();
		List<User> usertList = new ArrayList<>();
		Map<Integer,List<Huifu>> map = new HashMap<>();
		tie = tieDao.queryTieById(id);
		user1 = userDao.queryUserByUserName(tie.gettUsername());
		commentList = commentDao.queryCommentById(id);
		
		for(int i =0;i<commentList.size();i++){
			User commentUser = new User();
			List<Huifu> huifuList = new ArrayList<>();
			commentUser = userDao.queryUserByUserName(commentList.get(i).getcUsername());
			huifuList = huifuDao.queryHUifuById(commentList.get(i).getId());
			usertList.add(commentUser);
			map.put(commentList.get(i).getId(), huifuList);
		}
		request.setAttribute("tie", tie);
		request.setAttribute("user1", user1);
		request.setAttribute("commentList", commentList);
		request.setAttribute("usertList", usertList);
		request.setAttribute("map", map);
		request.getRequestDispatcher("tiezi.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
