package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.forum.pojo.Tie;
import com.forum.util.JdbcUtil;

public class QueryDao {
	static final int LISTSIZE=10;
	public List<Tie> queryTopic(String keyword) {
		keyword=keyword.toLowerCase();
		List<Tie> tieList=new ArrayList<Tie>();
		String sql="select * from lt_tie where tTitle like ?  or tUsername like  ? ";
		Connection conn=JdbcUtil.makeConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=conn.prepareStatement(sql);
			ps.setMaxRows(LISTSIZE);//
			ps.setString(1, keyword+"%");
			ps.setString(2, keyword+"%");
			rs=ps.executeQuery();
			while(rs.next()){
				Tie tie=new Tie();
				tie.setId(rs.getInt("id"));
				tie.settTitle(rs.getString("tTitle"));
				tie.settDate(rs.getString("tDate"));
				tie.settType(rs.getString("tType"));
				tie.settStyle(rs.getString("tStyle"));
				tie.settContent(rs.getString("tContent"));
				tie.settUsername(rs.getString("tUsername"));
				tieList.add(tie);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(conn, ps, rs);
		}
		return tieList;
	}
}
