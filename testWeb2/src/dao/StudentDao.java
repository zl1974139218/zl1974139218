package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import entity.BanJi;
import entity.Student;

public class StudentDao extends BaseDao{
	

	public int searchCount() {
		int count = 0;
		try {

			getStatment();
			String sql = "select count(id) from student";
			rs = stat.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return count;
	}
	
	public int searchCount(Student condition) {
		int count = 0;
		try {
			
			getStatment();
			String where=" where 1=1";

			if (condition.getName() != null) {
				where+=" and s.name='"+condition.getName()+"'";
			}
			if (condition.getSex() != null) {
				where+=" and sex='"+condition.getSex()+"'";

			}
			if (condition.getAge()!= -1) {
				where+=" and age="+condition.getAge();

			}
			if (condition.getBj().getId()!= 0) {
				where+=" and bj_id="+condition.getBj().getId();

			}
			String sql = "select count(s.id) from student as s left join banji as bj on s.bj_id=bj.id "+where;
			rs = stat.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return count;
	}

	public List<Student> searchByBegin(int begin, int num) {

		List<Student> list = new ArrayList<Student>();
		try {

			getStatment();
			String sql = "select * from student limit " + begin + " , " + num;
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setAge(rs.getInt("age"));
				list.add(stu);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return list;
	}

	public boolean add(Student stu) {
		boolean flag = false;

		try {
			String sql = "insert into student(name,sex,age,bj_id,photo)" + " values(?,?,?,?,?)";
			getPreparedStatement(sql);
			pstat.setString(1, stu.getName());
			pstat.setString(2, stu.getSex());
			pstat.setInt(3, stu.getAge());
			pstat.setInt(4, stu.getBj().getId());
			pstat.setString(5, stu.getPhoto());
			int rs = pstat.executeUpdate();
			if (rs > 0) {
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;
	}

	public List<Student> searchAll() {

		List<Student> list = new ArrayList<Student>();
		try {

			getStatment();
			String sql = "select * from student";
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setAge(rs.getInt("age"));
				list.add(stu);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public Student searchById(int id) {
		Student stu = null;
		
		try {
			getStatment();
			String sql = "select s.*,bj.name as bjName,bj.id as bjId from student as s left join banji as bj on s.bj_id=bj.id where s.id=" + id;
			rs = stat.executeQuery(sql);
			if (rs.next()) {
				stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setAge(rs.getInt("age"));
				stu.setPhoto(rs.getString("photo"));
				BanJi bj=new BanJi();
				bj.setName(rs.getString("bjName"));
				bj.setId(rs.getInt("bjId"));
				stu.setBj(bj);
				
				

			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return stu;

	}

	public boolean modify(Student stu) {
		boolean flag = false;
		try {
			
			String sql = "update student set name=?,sex=?,age=?,bj_id=?,photo=? where id=?";
			getPreparedStatement(sql);
			pstat.setString(1, stu.getName());
			pstat.setString(2, stu.getSex());
			pstat.setInt(3, stu.getAge());			
			if(stu.getBj().getId()==0){
				pstat.setObject(4, null);
			}else{
			pstat.setInt(4, stu.getBj().getId());}
			pstat.setString(5, stu.getPhoto());
			pstat.setInt(6, stu.getId());
			

			int rs = pstat.executeUpdate();
			if (rs > 0) {
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;
	}

	public boolean delete(int id) {
		boolean flag = false;
		try {
			String sql = "delete from student where id=" + id;
			getPreparedStatement(sql);
			int rs = pstat.executeUpdate();
			if (rs > 0) {
				flag = true;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return flag;
	}

	public List<Student> searchByCondition(Student condition,int begin,int pageNum) {
		boolean flag = false;
		List<Student> list = new ArrayList<Student>();
		try {

			getStatment();
			String where=" where 1=1";

			if (condition.getName() != null) {
				where+=" and s.name='"+condition.getName()+"'";
			}
			if (condition.getSex() != null) {
				where+=" and sex='"+condition.getSex()+"'";

			}
			if (condition.getAge()!= -1) {
				where+=" and age="+condition.getAge();

			}
			if (condition.getBj().getId()!= 0) {
				where+=" and bj_id="+condition.getBj().getId();

			}
			
			String sql = "select s.*,bj.name as bjName,bj.id as bjId,photo from student as s left join banji as bj on bj_id=bj.id "+where+" limit "+ begin+","+pageNum;
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setName(rs.getString("name"));
				stu.setSex(rs.getString("sex"));
				stu.setAge(rs.getInt("age"));
				stu.setPhoto(rs.getString("photo"));
				BanJi bj= new BanJi();
				bj.setId(rs.getInt("bjId"));
				bj.setName(rs.getString("bjName"));
				stu.setBj(bj);
				list.add(stu);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}

	

}
