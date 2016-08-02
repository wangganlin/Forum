package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forum.pojo.Comment;
import com.forum.util.JdbcUtil;
import com.forum.util.Page;

public class CommentDao {
	/**
	 * 增加评论
	 * 
	 * @param comment
	 */
	public void addComment(Comment comment) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			String sql = "insert into lt_comment(cDate,cContent,cUsername,ctieId) values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getcDate());
			ps.setString(2, comment.getcContent());
			ps.setString(3, comment.getcUsername());
			ps.setInt(4, comment.getTieId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据id删除评论
	 * 
	 * @param comment
	 */
	public void deleteComment(Comment comment) {
		Connection conn = null;
		String sql = "delete from lt_comment where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, comment.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 更改评论
	 * 
	 * @param comment
	 */
	public void updateComment(Comment comment) {
		Connection conn = null;
		String sql = "update lt_comment set cDate=?,cContent=?,cUsername=?,cTieId=? where id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment.getcDate());
			ps.setString(2, comment.getcContent());
			ps.setString(3, comment.getcUsername());
			ps.setInt(4, comment.getTieId());
			ps.setInt(5, comment.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
	}

	/**
	 * 根据cTieId查询评论
	 * 
	 * @param id
	 */
	public List<Comment> queryCommentById(int id) {
		Connection conn = null;
		String sql = "select * from lt_comment where cTieId=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Comment> commentList = new ArrayList<>();
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setcDate(rs.getString("cDate"));
				comment.setcContent(rs.getString("cContent"));
				comment.setcUsername(rs.getString("cUsername"));
				comment.setTieId(rs.getInt("ctieId"));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return commentList;
	}
	/**
	 * 
	 * @param page
	 * @return
	 */
	public List<Comment> queryCommentByPage(Page page) {
		String sql = "select * from lt_comment";
		List<Comment> list=new ArrayList<>();
		ResultSet rs=null;
		PreparedStatement ps=null;
		int startIndex=page.getStartIndex();
		int endIndex=page.getRowTotal()>page.getEndIndex()?page.getEndIndex():
			page.getRowTotal();
		Connection conn=JdbcUtil.makeConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setMaxRows(endIndex);//获取最大
			rs=ps.executeQuery();			
			if(startIndex>0){
				rs.absolute(startIndex);
			}
			do{
				Comment comment= new Comment();
				comment.setId(rs.getInt("id"));
				comment.setcDate(rs.getString("cDate"));
				comment.setcUsername(rs.getString("cUsername"));
				comment.setcContent(rs.getString("cContent"));
				comment.setTieId(rs.getInt("cTieId"));
				list.add(comment);				
			}while(rs.next());			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, ps, rs);
		}
		return list;
	}

	/**
	 * 获取分页 当前页码为1
	 * 
	 * @return Page
	 */
	public Page getPage() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String sql = "select * from lt_comment";
		int rowtotal = 0;
		try {
			conn = JdbcUtil.makeConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				rowtotal++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Page page = new Page(rowtotal, 1);
		return page;
	}
}
