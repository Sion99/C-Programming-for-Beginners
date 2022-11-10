<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lab #9 Response</title>
</head>
<body>
<% 
	String serverIP = "localhost";
	String strSID = "xe";
	String portNum = "1521";
	String user = "university";
	String pass = "comp322";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	/* System.out.println(url); */
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,pass);
	String query = "select fname, lname from employee where salary <= 30000 and dno = 5";
	/* System.out.println(query); */
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
%>
<h2>------ Lab #9: Repeating Lab #5-3 via JSP --------</h2>
<h4>-------- Q1 Result: ---------</h4>
<%
 	String pname1 = request.getParameter("pname1");
	String dnum = request.getParameter("dnum");
	String salary = request.getParameter("salary");
	query = "with temp as (select w.essn from works_on w join project p on (w.pno = p.pnumber) where p.pname like '"+pname1+"%'" + ") select distinct e.fname, e.lname from employee e join temp t on (e.ssn = t.essn) where e.salary <= "+salary+" and e.dno = "+dnum + " order by e.lname";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h4>-------- Q2 Result: ---------</h4>
<%
	String superssn1 = request.getParameter("superssn1");
	String addr = request.getParameter("addr");
	query = "select d.dnumber, d.dname, e.ssn, e.fname from employee e join department d on (e.dno = d.dnumber) where e.super_ssn = '"+superssn1+"' and e.address like '%" + addr + "%'";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	out.println("<table border=\"1\">");
	cnt = rsmd.getColumnCount();
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h4>-------- Q3 Result: ---------</h4>
<%	
	String pname2 = request.getParameter("pname2");
	String hours1 = request.getParameter("hours1");
	query = "select e.lname, p.pname, w.hours from employee e left join works_on w on e.ssn = w.essn left join project p on w.pno = p.pnumber where p.pname = '"+pname2+"' and w.hours >= "+hours1 + " order by w.hours desc";
	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	rsmd = rs.getMetaData();
	out.println("<table border=\"1\">");
	cnt = rsmd.getColumnCount();
	for(int i =1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
<h4>-------- Q4 Result: ---------</h4>
<%	
String pname3 = request.getParameter("pname3");
String hours2 = request.getParameter("hours2");
query = "select distinct e.fname, e.lname, w.hours from employee e left join works_on w on e.ssn = w.essn left join project p on w.pno = p.pnumber where p.pname like '%" + pname3 + "%' and w.hours >= " + hours2 + " order by w.hours";
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();
rsmd = rs.getMetaData();
out.println("<table border=\"1\">");
cnt = rsmd.getColumnCount();
for(int i =1;i<=cnt;i++){
	out.println("<th>"+rsmd.getColumnName(i)+"</th>");
}
while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("</tr>");
}
out.println("</table>");
%>
<h4>-------- Q5 Result: ---------</h4>
<%	
String superssn2 = request.getParameter("superssn2");
query = "select e.lname, e.fname, d.dependent_name, d.sex, d.relationship from employee e inner join dependent d on e.ssn = d.essn where e.super_ssn = '" + superssn2 + "'";
pstmt = conn.prepareStatement(query);
rs = pstmt.executeQuery();
rsmd = rs.getMetaData();
out.println("<table border=\"1\">");
cnt = rsmd.getColumnCount();
for(int i =1;i<=cnt;i++){
	out.println("<th>"+rsmd.getColumnName(i)+"</th>");
}
while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	out.println("</tr>");
}
out.println("</table>");
rs.close();
pstmt.close();
conn.close();
%>
</body>
</html>