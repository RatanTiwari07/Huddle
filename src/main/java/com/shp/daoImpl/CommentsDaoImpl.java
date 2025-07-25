package com.shp.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.shp.beans.CommentsBean;
import com.shp.util.DbUtil;
import com.shp.util.MailMessage;

public class CommentsDaoImpl {

	public boolean addComment (String email, String comment ,String name) {

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		boolean status=false;

		try {

			ps = con.prepareStatement("insert into comments values (?,?, NOW())");
			ps.setString(1, email);
			ps.setString(2, comment);

			int k = ps.executeUpdate();

			if (k>0) {
				status = true;

				MailMessage.fansMessage(email, name);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

		return status;
	}

	public void deleteComment (String email , Timestamp time) {

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMdd hhmmss");

			sdf.format(time);


			ps = con.prepareStatement("delete from comments where email = ? AND comment_date = ?");
			ps.setString(1, email);
			ps.setTimestamp(2, time);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}
	}

	public void deleteAllComment () {

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement("delete * from comments");

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
		}

	}

	public List<CommentsBean> getAllComments () {

		Connection con = DbUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CommentsBean> comList = new ArrayList<>();

		try {

			ps = con.prepareStatement("Select * from comments GROUP BY comment_date DESC ");

			rs = ps.executeQuery();

			while (rs.next()) {

				CommentsBean com = new CommentsBean();

				com.setEmail(rs.getString("email"));
				com.setComment(rs.getString("comment"));
				com.setComment_date(rs.getTimestamp("comment_date"));

				comList.add(com);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.closeConnection(con);
			DbUtil.closeConnection(ps);
			DbUtil.closeConnection(rs);
		}

		return comList;
	}

}














