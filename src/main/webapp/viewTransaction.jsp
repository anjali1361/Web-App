<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Transaction</title>
<link rel="stylesheet" href="./css/view_customer.css">
</head>
<body>
<center style="margin-top:70px;"><button type="button" class="btn btn-secondary" style="background-color:#8080ff;"><a href="home.jsp" style="text-decoration:none; color:white; padding:10px;">Go Back</a></button>
<%
String msg=request.getParameter("msg");
if("successful".equals(msg)){ %>
<center style="color:green; font-weight:bold; font-family:cursive;"><h1>Transaction Successful !!</h1></center>
<%}else if("failed".equals(msg)){ %>
<center style="color:red; font-weight:bold; font-family:cursive; margin-top:10px;"><h1>Something went wrong &#128528;</h1></center>
<%} %>
<div class="containing_table">
<%try{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs= st.executeQuery("select * from transfer");
%>
<table id="customers">
<tr>
<th>From</th>
<th>To</th>
<th>Money Transferred(in Rs.)</th>
<th>Date & Time</th>
</tr>
<%
while(rs.next())
{ %>
	<tr>
	<td id="from"><%=rs.getString(1) %></td>
	<td id="to"><%=rs.getString(2) %></td>
	<td id="moneyTransferred"><%=rs.getInt(3) %></td>
	<td id="date"><%=rs.getString(4) %></td>
	</tr>

<%} %>
<% con.close();
} catch(Exception e){ %>
<center style="color:red; font-weight:bold; font-family:cursive;"><h1>No Transaction Yet &#128528;</h1></center>
<%} %>
</table>
</div>
</body>
</html>