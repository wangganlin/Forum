package com.forum.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.TieDao;
import com.forum.pojo.Tie;
import com.forum.pojo.User;
import com.forum.util.Page;

/**
 * Servlet implementation class ManagerCenterServlet
 */
@WebServlet("/ManagerCenterServlet")
public class ManagerCenterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerCenterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String count = request.getParameter("count");
		TieDao dao = new TieDao();
		List<Tie> list = null;
		Page page = new Page();
		if (null != count) {
			page = dao.getPage(Integer.parseInt(count));
		} else {
			page = dao.getPage(1);
		}
		list = dao.queryAllTieByPage(page);
		System.out.println("±í³¤£º" + list.size());
		request.setAttribute("page", page);
		request.setAttribute("tieList", list);
		request.getRequestDispatcher("admin-index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
