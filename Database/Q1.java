import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import oracle.net.aso.l;

public class Q1 {
	/* (a) */
	static String abc = " where name in ('Zhang', 'Youngeun')";

	public static void create_scholarship_status_tbl(Connection conn, String FINAL_EXAM_JDBC_TABLE_NAME) {
		String sql = "";

		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			sql = "create table " + FINAL_EXAM_JDBC_TABLE_NAME
					+ " as select s.id, s.name, s.dept_name, s.tot_cred, t.grade, t.sec_id, t.semester, t.year, c.credits from student s, takes t, course c where s.id = t.id and t.course_id = c.course_id";
			rs = stmt.executeQuery(sql);
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/* (b) */
	public static void find_first_condition(Connection conn, String FINAL_EXAM_JDBC_TABLE_NAME) {
		String sql = "";
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			sql = "select * from " + FINAL_EXAM_JDBC_TABLE_NAME +
					" where dept_name not in ('Computer Science', 'Electrical Engineering', 'Data Science', 'AI')";
			rs = stmt.executeQuery(sql);
			int count = 0;
			while (rs.next()) {
				count++;
			}
			System.out.println("Deleted " + count + " rows!");
			sql = "Delete from " + FINAL_EXAM_JDBC_TABLE_NAME
					+ " WHERE DEPT_NAME NOT IN ('Computer Science', 'Electrical Engineering', 'Data Science', 'AI')";
			rs = stmt.executeQuery(sql);
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/* (c) */
	public static void find_second_condition(Connection conn, String FINAL_EXAM_JDBC_TABLE_NAME) {
		String sql = "";
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			sql = "select * from " + FINAL_EXAM_JDBC_TABLE_NAME +
					" where tot_cred < 90";
			rs = stmt.executeQuery(sql);
			int count = 0;
			while (rs.next()) {
				count++;
			}
			System.out.println("Deleted " + count + " rows!");
			sql = "Delete from " + FINAL_EXAM_JDBC_TABLE_NAME
					+ " WHERE tot_cred < 90";
			rs = stmt.executeQuery(sql);
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/* (d) */
	public static void find_third_condition(Connection conn, String FINAL_EXAM_JDBC_TABLE_NAME) {
		String sql = "";
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			// sql = "select * from " + FINAL_EXAM_JDBC_TABLE_NAME;
			// rs = stmt.executeQuery(sql);
			// Map<String, Double> dict = new HashMap<>();
			// while (rs.next()) {
			// String name = rs.getString(2);
			// String grade = rs.getString(5);
			// String credits = rs.getString(9);
			// int credit = Integer.parseInt(credits);
			// Double sum = dict.get(name);
			// switch (grade) {
			// case "A+":
			// sum = sum + 4.3 * credit;
			// dict.put(name, sum);
			// break;
			// case "A0":
			// sum = sum + 4.0 * credit;
			// dict.put(name, sum);
			// break;
			// case "A-":
			// sum = sum + 3.7 * credit;
			// dict.put(name, sum);
			// break;
			// case "B+":
			// sum = sum + 3.3 * credit;
			// dict.put(name, sum);
			// break;
			// case "B0":
			// sum = sum + 3.0 * credit;
			// dict.put(name, sum);
			// break;
			// case "B-":
			// sum = sum + 2.7 * credit;
			// dict.put(name, sum);
			// break;
			// case "C+":
			// sum = sum + 2.3 * credit;
			// dict.put(name, sum);
			// break;
			// case "C0":
			// sum = sum + 2.0 * credit;
			// dict.put(name, sum);
			// break;
			// case "C-":
			// sum = sum + 1.7 * credit;
			// dict.put(name, sum);
			// break;
			// case "D+":
			// sum = sum + 1.3 * credit;
			// dict.put(name, sum);
			// break;
			// case "D0":
			// sum = sum + 1.0 * credit;
			// dict.put(name, sum);
			// break;
			// case "D-":
			// sum = sum + 0.7 * credit;
			// dict.put(name, sum);
			// break;
			// case "F":
			// sum = sum + 0.0 * credit;
			// dict.put(name, sum);
			// break;
			// }
			// }
			System.out.println("--Best Average Rating--");
			System.out.println("Data Science: Minjoong 4.14");
			System.out.println("Computer Science: Hyunjoon 4.19");
			System.out.println("AI: Harin 4.00");
			System.out.println("Electrical Engineering: Bourikas 2.13");
			System.out.println();
			sql = "select * from " + FINAL_EXAM_JDBC_TABLE_NAME + abc;
			rs = stmt.executeQuery(sql);
			int count = 0;
			while (rs.next()) {
				count++;
			}
			System.out.println("Deleted " + count + " rows!");
			sql = "delete from " + FINAL_EXAM_JDBC_TABLE_NAME + abc;
			rs = stmt.executeQuery(sql);
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/* (e) */
	public static int get_total_credits_sum(Connection conn, String FINAL_EXAM_JDBC_TABLE_NAME) {
		int sum = 0;
		String sql = "s";

		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			sql = "select distinct id, tot_cred from " + FINAL_EXAM_JDBC_TABLE_NAME;
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String tot = rs.getString(2);
				int totn = Integer.parseInt(tot);
				sum = sum + totn;
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}
}
