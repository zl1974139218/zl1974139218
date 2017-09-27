package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.BanJi;
import entity.Score;
import entity.Student;
import entity.Subject;

public class ScoreDao extends BaseDao {
	public List<Score> searchByCondition(Score condition, int begin, int num) {
		List<Score> list = new ArrayList<Score>();
		try {
			getStatment();
			String where = "where 1=1";
			if (!"".equals(condition.getStu().getName())) {
				where += " and stuName like '%" + condition.getStu().getName()
						+ "%'";
			}
			if (condition.getStu().getBj().getId() != 0) {
				where += " and BjId=" + condition.getStu().getBj().getId();

			}
			if (condition.getSub().getId() != 0) {
				where += " and subId=" + condition.getSub().getId();

			}

			String sql = "select * from v_stu_sub_bj_sc " + where + " limit "
					+ begin + "," + num;
			System.out.println(sql);
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				Score sc = new Score();
				sc.setId(rs.getInt("scId"));
				sc.setScore((Integer)rs.getObject("score"));
				sc.setGrade(rs.getString("grade"));
				Student stu = new Student();
				stu.setId(rs.getInt("stuId"));
				stu.setName(rs.getString("stuName"));
				BanJi bj = new BanJi();
				bj.setId(rs.getInt("BjId"));
				bj.setName(rs.getString("bjName"));
				stu.setBj(bj);
				Subject sub = new Subject();
				sub.setId(rs.getInt("subId"));
				sub.setName(rs.getString("subName"));
				sc.setStu(stu);
				sc.setSub(sub);
				list.add(sc);
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

	public int searchByCount(Score condition) {
		int result = 0;
		try {
			getStatment();
			String where = "where 1=1";
			if (!"".equals(condition.getStu().getName())) {
				where += " and stuName like '%" + condition.getStu().getName()
						+ "%'";
			}
			if (condition.getStu().getBj().getId() != 0) {
				where += " and BjId=" + condition.getStu().getBj().getId();

			}
			if (condition.getSub().getId() != 0) {
				where += " and subId=" + condition.getSub().getId();

			}

			String sql = "select count(*) from v_stu_sub_bj_sc " + where;
			System.out.print(sql);
			rs = stat.executeQuery(sql);
			while (rs.next()) {
				result = rs.getInt(1);
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
		return result;
	}

	public boolean add(Score sc) {
		boolean flag=false;
		try {
			getStatment();
			String sql="insert into v_stu_sub (stuId,subId,score)"+
			" values("+sc.getStu().getId()+","+sc.getSub().getId()+","+sc.getScore()+")";
			int rs=stat.executeUpdate(sql);
			if(rs>0){
				flag=true;
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
		return flag;
	}

	public boolean update(Score sc) {
		boolean flag=false;
		try {
			getStatment();
			String sql="update v_stu_sub set score="+sc.getScore()+" where scId="+sc.getId();
			int rs=stat.executeUpdate(sql);
			if(rs>0){
				flag=true;
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
		
		
		return flag;
	}

	public Score searchByScore(Score sc) {
		Score score =null;
		try {
			getStatment();
			
			String sql = "select * from v_stu_sub where stuId="+sc.getStu().getId()+" and subId="+sc.getSub().getId();
			System.out.println(sql);
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				score = new Score();
				score.setId(rs.getInt("scId"));
				score.setScore((Integer)rs.getObject("score"));
				score.setGrade(rs.getString("grade"));
				
			
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return score;
		
	}

}
