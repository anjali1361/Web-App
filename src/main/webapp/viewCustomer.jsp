<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Customers</title>
<link rel="stylesheet" href="./css/view_customer.css">
</head>
<body>
<div class="containing_table">
<%try{
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs= st.executeQuery("select * from customer");
%>
<table id="customers">
<tr>
<th>Name</th>
<th>Email</th>
<th>Mobile</th>
<th>IFSC Code</th>
<th>Account No.</th>
<th>Current Balance(in Rs.)</th>
<th>Transfer</th>
</tr>
<%
while(rs.next())
{%>
	<tr>
	<td id="name"><%=rs.getString(1) %></td>
	<td id="email"><%=rs.getString(2) %></td>
	<td id="mobile"><%=rs.getString(3) %></td>
	<td id="ifsc"><%=rs.getString(4) %></td>
	<td id="accountNo"><%=rs.getString(5) %></td>
	<td id="balance"><%=rs.getString(6) %></td>
	<td><center><a class="btn btn-primary" type="button" href="selectUserToTransfer.jsp?email=<%=rs.getString(2) %>" style="color:white; text-decoration:none; background-color: #8080ff;">Transfer</a></center></td>
	</tr>

<%} %>
<% con.close();
} catch(Exception e){ %>
<center style="color:red; font-weight:bold; font-family:cursive;"><h1>Something went wrong &#128528;</h1></center>
<%} %>
</table>
</div>
<!-- <script>
var table = document.getElementById("customers"),rIndex;
for(var i=1;i<table.rows.length;i++){
	var n2=table.rows[i].cells.length;
	
 table.rows[i].onclick=function(){
	rIndex=this.rowIndex;
	var fromUser = this.cells.item(0).innerText;
	var fromEmail = this.cells.item(1).innerText;
	var fromMobile = this.cells.item(2).innerText;
	var fromIfsc = this.cells.item(3).innerText;
	var fromAccountNo= this.cells.item(4).innerText;
	var fromBalance = this.cells.item(5).innerText;
	console.log(name+" "+email+" "+mobile+" "+ifsc+" "+accountNo+" "+balance);
	
	sessionStorage.setItem("name",fromUser);
	sessionStorage.setItem("email",fromEmail);
	sessionStorage.setItem("mobile",fromMobile);
	sessionStorage.setItem("ifsc",fromIfsc);
	sessionStorage.setItem("accountNo",fromAccountNo);
	sessionStorage.setItem("balance",fromBalance);
 };
}
</script> -->
</body>
</html>