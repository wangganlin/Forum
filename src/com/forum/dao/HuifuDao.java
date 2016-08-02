package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.forum.pojo.Huifu;
import com.forum.util.JdbcUtil;

public class HuifuDao {

	/**
	 * 增加回复
	 * 
	 * @param comment
	 */
	public void addHuifu(Huifu huifu) {
		Connection conn = null;
		String sql = "insert into lt_huifu(hDate,hContent,cUsername,hUsername,HcomId) values(?,?,?,?,?)";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, huifu.gethDate());
			ps.setString(2, huifu.gethContent());
			ps.setString(3, huifu.getcUsername());
			ps.setString(4, huifu.gethUersname());
			ps.setInt(5, huifu.getHcomId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据id删除回复
	 * 
	 * @param comment
	 */
	public void deleteHuifu(Huifu huifu) {
		Connection conn = null;
		String sql = "delete from lt_huifu where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, huifu.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 更改回复
	 * 
	 * @param comment
	 */
	public void updateHuifu(Huifu huifu) {
		Connection conn = null;
		String sql = "update lt_huifu set hDate=?,hContent=?,hUsername=?,HcomId=? where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, huifu.gethDate());
			ps.setString(2, huifu.gethContent());
			ps.setString(3, huifu.gethUersname());
			ps.setInt(4, huifu.getHcomId());
			ps.setInt(5, huifu.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据id查询回复
	 * 
	 * @param id
	 */
	public List<Huifu> queryHUifuById(int cId) {
		Connection conn = null;
		String sql = "select * from lt_huifu where hcomId=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Huifu> huifuList = new ArrayList<>();
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cId);
			rs = ps.executeQuery();
			while (rs.next()) {
				Huifu huifu = new Huifu();
				huifu.setId(rs.getInt("id"));
				huifu.sethDate(rs.getString("hDate"));
				huifu.sethContent(rs.getString("hContent"));
				huifu.setcUsername(rs.getString("cUsername"));
				huifu.sethUersname(rs.getString("hUsername"));
				huifu.setHcomId(rs.getInt("HcomId"));
				huifuList.add(huifu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return huifuList;
	}
}
