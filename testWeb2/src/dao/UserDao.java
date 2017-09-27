package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import entity.Student;
import entity.User;

public class UserDao extends BaseDao {
	public User searchByUserNameAndPassword(User searchUser) {
		Connection conn = null;
		User user = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf-8",
			 "root", "123");
			 Statement stat= conn.createStatement();
//			getStatment();
			rs = stat.executeQuery("select * from users where username='"
					+ searchUser.getUsername() + "'and password='"
					+ searchUser.getPassword() + "'");
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
			

			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return user;
	}

	public User sava(User user) {
		
		User u=null;
		try {

			String sql = "insert into users(username,time)"
					+ " values(?,?)";
			Connection conn=getConnection();
			
			PreparedStatement pstat=conn.prepareStatement(sql);
			pstat.setString(1, user.getUsername());
			//pstat.setString(2, user.getPassword());
			pstat.setTimestamp(2, user.getTime());

			int result=pstat.executeUpdate();
			if(result>0){
				sql="select LAST_INSERT_ID()";
				ResultSet rs=pstat.executeQuery(sql);
				while(rs.next()){
					u=new User();
					u.setId(rs.getInt(1));
					u.setUsername(user.getUsername());
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return u;
	}
public User update(User user) {
		
		User u=null;
		try {

			String sql = "update users set password=? where id=?";
			Connection conn=getConnection();
			
			PreparedStatement pstat=conn.prepareStatement(sql);
			pstat.setString(1, user.getPassword());
			//pstat.setString(2, user.getPassword());
			pstat.setInt(2, user.getId());

			int result=pstat.executeUpdate();
			if(result>0){
				u=user;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return u;
	}
	public User searchByName(String name) {
		Connection conn = null;
		User user = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf-8",
			 "root", "123");
			 Statement stat= conn.createStatement();
//			getStatment();
			rs = stat.executeQuery("select * from users where username='"
					+name+ "'");
			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setTime(rs.getTimestamp("time"));
				user.setUsername(rs.getString("username"));
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return user;
	}
}
