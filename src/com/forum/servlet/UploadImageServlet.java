package com.forum.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.forum.dao.TieDao;
import com.forum.dao.UserDao;
import com.forum.pojo.User;

/**
 * Servlet implementation class UploadImageServlet
 */
@WebServlet("/UploadImageServlet")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		User user = (User) request.getSession().getAttribute("user");
		System.out.println("id"+user.getId());
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		Part img = request.getPart("image");
		String imgName=null;

		/**
		 * ÉÏ´«Í¼Æ¬
		 */
			String content = img.getHeader("content-disposition");
			System.out.println(content);			
			int start = content.lastIndexOf(".");
			int end = content.length() - 1;
			String type = content.substring(start, end);
			System.out.println(type);
			String path = request.getServletContext().getRealPath("photo" + File.separator);
			System.out.println("path" + path);
			imgName= UUID.randomUUID() + type;
			String relativePath = File.separator + imgName;
			System.out.println("relativePath" + relativePath);
			String realPath = path + relativePath;
			img.write(realPath);
		
		/*
		 * String imgPath="photo"+relativePath; String
		 * imgPath="photo"+relativePath; System.out.println(imgPath);
		 */
		System.out.println("success");
		UserDao dao = new UserDao();
		TieDao dao2 = new TieDao();
		dao2.updateUserName(username, user.getuName());
		user.setuPhoto(imgName);
		user.setEmail(email);
		user.setTel(tel);
		user.setuName(username);
		dao.updateUser(user);
		dao.updataPhoto(user);
		request.getSession().setAttribute("user", user);
		// System.out.println("photo:" + user.getuPhoto());
		request.setAttribute("img", imgName);
		response.sendRedirect("InformationServlet");
		//request.getRequestDispatcher("LoginServlet").forward(request, response);

		/*
		 * request.getRequestDispatcher("InformationServlet").forward(request,
		 * response);
		 */
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
