package com.forum.servlet;

import java.io.IOException;
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.TieDao;
import com.forum.pojo.PersonTie;
import com.forum.pojo.Tie;
import com.forum.pojo.User;
import com.forum.util.Page;

/**
 * Servlet implementation class InformationServlet
 */
@WebServlet("/InformationServlet")
public class InformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InformationServlet() {
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
		String count = request.getParameter("count");
		TieDao dao = new TieDao();
		List<PersonTie> list = null;
		Page page = new Page();
		if (null != count) {
			page = dao.getTiePageByUser(Integer.parseInt(count), user);
		} else {
			page = dao.getTiePageByUser(1, user);
		}
		list = dao.queryTieByPage(page, user);
		System.out.println("������" + list.size());
		list.forEach(n->System.out.println(n.getName()+n.getComment()));
		request.setAttribute("page", page);
		request.setAttribute("tieList", list);
		request.getRequestDispatcher("information.jsp").forward(request, response);
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
