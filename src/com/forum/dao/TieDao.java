package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.Finishings;

import com.forum.pojo.PersonTie;
import com.forum.pojo.Tie;
import com.forum.pojo.User;
import com.forum.util.JdbcUtil;
import com.forum.util.Page;

public class TieDao {
	/**
	 * 增加帖子
	 * 
	 * @param comment
	 */
	public void addTie(Tie tie) {
		Connection conn = null;
		String sql = "insert into lt_tie(tTitle,tDate,tType,tStyle,tContent,tUsername) values(?,?,?,?,?,?)";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, tie.gettTitle());
			ps.setString(2, tie.gettDate());
			ps.setString(3, tie.gettType());
			ps.setString(4, tie.gettStyle());
			ps.setString(5, tie.gettContent());
			ps.setString(6, tie.gettUsername());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据id删除帖子
	 * 
	 * @param comment
	 */
	public void deleteTie(Tie tie) {
		Connection conn = null;
		String sql = "delete from lt_tie where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, tie.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 更改帖子
	 * 
	 * @param comment
	 */
	public void updateTie(Tie tie) {
		Connection conn = null;
		String sql = "update lt_tie set tTitle=?,tDate=?,tType=?,tStyle=?,tContent=?,tUsername=? where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, tie.gettTitle());
			ps.setString(2, tie.gettDate());
			ps.setString(3, tie.gettType());
			ps.setString(4, tie.gettStyle());
			ps.setString(5, tie.gettContent());
			ps.setString(6, tie.gettUsername());
			ps.setInt(7, tie.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据id查询帖子
	 * 
	 * @param id
	 */
	public Tie queryTieById(int id) {
		Connection conn = null;
		String sql = "select * from lt_tie where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Tie tie = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settTitle(rs.getString("tTitle"));
				tie.settDate(rs.getString("tDate"));
				tie.settType(rs.getString("tType"));
				tie.settStyle(rs.getString("tStyle"));
				tie.settContent(rs.getString("tContent"));
				tie.settUsername(rs.getString("tUsername"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return tie;
	}

	/**
	 * 查询帖子分页
	 * 
	 * @param page
	 * @return 默认记录为10条
	 */
	public List<Tie> queryTieByPage(Page page) {
		String sql = "select * from lt_tie";
		List<Tie> list = new ArrayList<>();
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
				Tie tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settDate(rs.getString("tDate"));
				tie.settUsername(rs.getString("tUsername"));
				tie.settContent(rs.getString("tContent"));
				tie.settType(rs.getString("tType"));
				tie.settUsername(rs.getString("tUsername"));
				tie.settTitle(rs.getString("tTitle"));
				list.add(tie);
			} while (rs.next());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return list;
	}

	public List<Tie> queryTieByPage(Page page, String type) {
		String sql = "select * from lt_tie where tStyle=? order by id desc";
		List<Tie> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement ps = null;
		int startIndex = page.getStartIndex();
		int endIndex = page.getRowTotal() > page.getEndIndex() ? page.getEndIndex() : page.getRowTotal();
		Connection conn = JdbcUtil.makeConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setMaxRows(endIndex);// 获取最大
			rs = ps.executeQuery();
			if (startIndex > 0) {
				rs.absolute(startIndex);
			}
			do {
				Tie tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settDate(rs.getString("tDate"));
				tie.settUsername(rs.getString("tUsername"));
				tie.settContent(rs.getString("tContent"));
				tie.settType(rs.getString("tType"));
				tie.settUsername(rs.getString("tUsername"));
				tie.settTitle(rs.getString("tTitle"));
				list.add(tie);
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
	public Page getPage(int count) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select count(*) as count from lt_tie;";
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
		Page page = new Page(rowtotal, count);
		return page;
	}

	/**
	 * 获取类型获取帖子的分页信息
	 * 
	 * @return
	 */
	public Page getPage(int count, String type) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select count(*) as count from lt_tie where tStyle=?";
		int rowtotal = 0;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			rs = ps.executeQuery();
			while (rs.next()) {
				rowtotal = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Page page = new Page(rowtotal, count);
		return page;
	}

	// 查询精贴
	public List<Tie> checkBetterTie() {
		List<Tie> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			conn = JdbcUtil.makeConnection();
			String sql = "select * from lt_tie where tType=? order by id desc limit 10";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "better");
			rs = ps.executeQuery();
			while (rs.next()) {
				Tie tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settTitle(rs.getString("tTitle"));
				tie.settDate(rs.getString("tDate"));
				tie.settType(rs.getString("tType"));
				tie.settStyle(rs.getString("tStyle"));
				tie.settContent(rs.getString("tContent"));
				tie.settUsername(rs.getString("tUsername"));
				list.add(tie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}

		return list;
	}

	// 查询新帖
	public List<Tie> checkNewTie() {
		List<Tie> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = null;
		try {
			conn = JdbcUtil.makeConnection();
			String sql = "select * from lt_tie order by id desc limit 10";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Tie tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settTitle(rs.getString("tTitle"));
				tie.settDate(rs.getString("tDate"));
				tie.settType(rs.getString("tType"));
				tie.settStyle(rs.getString("tStyle"));
				tie.settContent(rs.getString("tContent"));
				tie.settUsername(rs.getString("tUsername"));
				list.add(tie);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}

		return list;
	}

	/**
	 * 根据用户查询帖子数量
	 * 
	 * @param user
	 * @return
	 */
	public int getTieNum(User user) {
		ResultSet rs = null;
		PreparedStatement ps = null;
		Connection conn = null;
		int num = 0;
		try {
			conn = JdbcUtil.makeConnection();
			String sql = "select count(*) as num from lt_tie where tUsername=?";
			ps = conn.prepareStatement(sql);
			ps.setMaxRows(1);
			ps.setString(1, user.getuName());
			rs = ps.executeQuery();
			while (rs.next()) {
				num = rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return num;
	}

	/**
	 * 根据用户获取帖子分页
	 * 
	 * @param count
	 * @param user
	 * @return
	 */
	public Page getTiePageByUser(int count, User user) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select count(*) as count from lt_tie where tUsername=?";
		int rowtotal = 0;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getuName());
			rs = ps.executeQuery();
			while (rs.next()) {
				rowtotal = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Page page = new Page(rowtotal, count);
		return page;
	}

	/**
	 * 获取当前页码的帖子信息
	 * 
	 * @param page
	 * @param user
	 * @return
	 */
	public List<PersonTie> queryTieByPage(Page page, User user) {
		String sql = "select a.id,a.tUsername,a.tDate,a.tStyle,a.tType,a.tTitle,b.num from lt_tie as a left join (select cTieId,count(*) as num   from lt_comment group by  cTieId)  as b on a.id=b.cTieId "
				+ " where a.tUsername= ? order by a.id desc";
		List<PersonTie> list = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement ps = null;
		int startIndex = page.getStartIndex();
		int endIndex = page.getRowTotal() > page.getEndIndex() ? page.getEndIndex() : page.getRowTotal();
		Connection conn = JdbcUtil.makeConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getuName());
			ps.setMaxRows(endIndex);// 获取最大
			rs = ps.executeQuery();
			if (startIndex > 0) {
				rs.absolute(startIndex);
			}
			do {
				PersonTie tie = new PersonTie();
				tie.setId(rs.getInt("id"));
				tie.setData(rs.getString("tDate"));
				tie.setComment(rs.getInt("num"));
				tie.setType(rs.getString("tType"));
				tie.setStyle(rs.getString("tStyle"));
				tie.setName(rs.getString("tUsername"));
				tie.setTitle(rs.getString("tTitle"));
				list.add(tie);
			} while (rs.next());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return list;
	}

	public void updateUserName(String name1, String name2) {
		Connection conn = null;
		String sql = "update lt_tie set tUsername=? where tUserName = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name1);
			ps.setString(2, name2);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 查看所有帖子
	 * 
	 * @param page
	 * @return
	 */
	public List<Tie> queryAllTieByPage(Page page) {
		String sql = "select * from lt_tie order by id desc";
		List<Tie> list = new ArrayList<>();
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
				Tie tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settDate(rs.getString("tDate"));
				tie.settUsername(rs.getString("tUsername"));
				tie.settContent(rs.getString("tContent"));
				tie.settType(rs.getString("tType"));
				tie.settUsername(rs.getString("tUsername"));
				tie.settTitle(rs.getString("tTitle"));
				tie.settStyle(rs.getString("tStyle"));
				list.add(tie);
			} while (rs.next());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return list;
	}

	/**
	 * 删除帖子
	 * 
	 * @param id
	 */
	public void deleteTieById(int id) {
		String sql = "delete from lt_tie where id=?";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		conn = JdbcUtil.makeConnection();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 设为精帖
	 * 
	 * @param id
	 */
	public void setBetterTie(int id) {
		String sql = "update lt_tie set tType =? where id=?";
		Connection conn = JdbcUtil.makeConnection();
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "better");
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}
	
	public Tie queryTiebyName(String name) {
		Connection conn = null;
		String sql = "select * from lt_tie where tTitle=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Tie tie = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while (rs.next()) {
				tie = new Tie();
				tie.setId(rs.getInt("id"));
				tie.settTitle(rs.getString("tTitle"));
				tie.settDate(rs.getString("tDate"));
				tie.settType(rs.getString("tType"));
				tie.settStyle(rs.getString("tStyle"));
				tie.settContent(rs.getString("tContent"));
				tie.settUsername(rs.getString("tUsername"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return tie;
	}
}
