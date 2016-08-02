package com.forum.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.QueryDao;
import com.forum.pojo.Tie;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String keyword=request.getParameter("keyword");
		System.out.println(keyword);
		QueryDao dao=new QueryDao();
		List<Tie> list=new ArrayList<>();
		list=dao.queryTopic(keyword);
		/*JsonBuilderFactory factory=Json.createBuilderFactory(null);
		JsonObject json=factory.createObjectBuilder().add("listY", list.get(0).getId())
				.add("listE", list.get(1).getId()).build();*/
		JSONArray json=new JSONArray();
		json=JSONArray.fromObject(list);
		System.out.println(json.toString());
		response.getWriter().append(json.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
