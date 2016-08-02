package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forum.pojo.User;
import com.forum.util.JdbcUtil;
import com.forum.util.Page;

public class UserDao {
	/**
	 * 增加会员
	 * 
	 * @param comment
	 */
	public void addUser(User user) {
		Connection conn = null;
		String sql = "insert into lt_user(uName,uPwd,uPhoto,gender,type,tel,email) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getuName());
			ps.setString(2, user.getuPwd());
			ps.setString(3, user.getuPhoto());
			ps.setString(4, user.getGender());
			ps.setInt(5, user.getType());
			ps.setString(6, user.getTel());
			ps.setString(7, user.getEmail());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据id删除会员
	 * 
	 * @param comment
	 */
	public void deleteUser(User user) {
		Connection conn = null;
		String sql = "delete from lt_user where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 更改会员
	 * 
	 * @param comment
	 */
	public void updateUser(User user) {
		Connection conn = null;
		String sql = "update lt_user set uName=?,uPwd=?,uPhoto=?,gender=?,type=?,tel=?,email=? where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getuName());
			ps.setString(2, user.getuPwd());
			ps.setString(3, user.getuPhoto());
			ps.setString(4, user.getGender());
			ps.setInt(5, user.getType());
			ps.setString(6, user.getTel());
			ps.setString(7, user.getEmail());
			ps.setInt(8, user.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据email查询会员
	 * 
	 * @param email
	 */
	public User queryUserByEmail(String email) {
		Connection conn = null;
		String sql = "select id,uName,uPwd,uPhoto,gender,type,tel,email from lt_user where email=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setuName(rs.getString("uName"));
				user.setuPwd(rs.getString("uPwd"));
				user.setuPhoto(rs.getString("uPhoto"));
				user.setGender(rs.getString("gender"));
				user.setType(rs.getInt("type"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return user;
	}

	// 根据用户名查询用户
	public User queryUserByUserName(String uName) {
		Connection conn = null;
		String sql = "select uName,uPwd,uPhoto,gender,type,tel,email from lt_user where uName=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, uName);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setuName(rs.getString("uName"));
				user.setuPwd(rs.getString("uPwd"));
				user.setuPhoto(rs.getString("uPhoto"));
				user.setGender(rs.getString("gender"));
				user.setType(rs.getInt("type"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return user;
	}

	/**
	 * 获取用户分页列表
	 * 
	 * @param page
	 * @return
	 */
	public List<User> queryUserByPage(Page page) {
		String sql = "select * from lt_user";
		List<User> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement ps = null;
		int startIndex = page.getStartIndex();
		int endIndex = page.getRowTotal() > page.getEndIndex() ? page.getEndIndex() : page.getRowTotal();
		Connection conn = JdbcUtil.makeConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setMaxRows(endIndex);// 获取最大
			rs = ps.executeQuery();
			if (startIndex > 0) {
				rs.absolute(startIndex);
			}
			do {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setuName(rs.getString(2));
				user.setuPwd(rs.getString(3));
				user.setuPhoto(rs.getString(4));
				user.setGender(rs.getString(5));
				user.setType(rs.getInt(6));
				user.setTel(rs.getString(7));
				user.setEmail(rs.getString(8));
				list.add(user);
			} while (rs.next());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return list;
	}

	/**
	 * 获取帖子的分页信息
	 * 
	 * @return
	 */
	public Page getPage() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select count(*) as count from lt_user";
		int rowtotal = 0;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				rowtotal = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Page page = new Page(rowtotal, 1);
		return page;
	}

	// 按用户名称查询
	public static User queryUser(String uName) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user = null;
		try {
			conn = JdbcUtil.makeConnection();
			String sql = "select * from lt_user where uName=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, uName);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setuName(rs.getString("uName"));
				user.setuPwd(rs.getString("uPwd"));
				user.setuPhoto(rs.getString("uPhoto"));
				user.setGender(rs.getString("gender"));
				user.setType(rs.getInt("type"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return user;
	}

	// 排行榜
	public List<User> paihangbang() {
		List<User> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			conn = JdbcUtil.makeConnection();
			String sql = "select count(*),tUsername from lt_tie group by tUsername order by count(*) desc limit 10";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user = UserDao.queryUser(rs.getString("tUsername"));
				user.settNum(rs.getInt("count(*)"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}

		return list;
	}

	/**
	 * 根据user.id更改用户图像user.uphoto
	 * 
	 * @param user
	 */
	public void updataPhoto(User user) {
		Connection conn = null;
		String sql = "update lt_user set uPhoto=? where uName=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getuPhoto());
			ps.setString(2, user.getuName());
			System.out.println("userid:" + user.getuName());
			int i = ps.executeUpdate();
			System.out.println(i);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

}
