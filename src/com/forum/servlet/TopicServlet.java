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
import com.forum.util.Page;

/**
 * Servlet implementation class TopicServlet
 */
@WebServlet("/TopicServlet")
public class TopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		String count=request.getParameter("count");
		if(type.equals("c  ")){
			type="c++";
		}else if(type.equals("c")){
			type="c#";
		}
		System.out.println("¿‡–Õ:"+type);
		System.out.println("“≥¬Î£∫"+count);
		TieDao dao=new TieDao();
		Page page=new Page();
		
		if(null !=count){
			page=dao.getPage(Integer.parseInt(count),type);
		}else{
			page=dao.getPage(1,type);
		}		
		List<Tie> list=dao.queryTieByPage(page, type);
		request.setAttribute("tieList", list);
		request.setAttribute("style", type);
		request.setAttribute("page", page);
		request.getRequestDispatcher("showdata.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
