package com.forum.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forum.dao.HuifuDao;
import com.forum.pojo.Huifu;

/**
 * Servlet implementation class CommentHuifuServlet
 */
@WebServlet("/CommentHuifuServlet")
public class CommentHuifuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentHuifuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String hContent = request.getParameter("huifuContent");
		String cUsername = request.getParameter("cUsername");
		String hUsername = request.getParameter("hUsername");
		System.out.println(hUsername);
		int hcomId = Integer.parseInt(request.getParameter("hcomId"));
		System.out.println(hcomId);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date date = new Date();
		String hDate = sdf.format(date);
		
		HuifuDao huifuDao = new HuifuDao();
		Huifu huifu = new Huifu();
		huifu.sethDate(hDate);
		huifu.setcUsername(cUsername);;
		huifu.sethUersname(hUsername);
		huifu.sethContent(hContent);
		huifu.setHcomId(hcomId);
		huifuDao.addHuifu(huifu);
		net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(huifu);
		/*Object result=json.put(key, value)*/
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(jsonObject.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
