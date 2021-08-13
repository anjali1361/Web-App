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
<title>Select user to transfer money</title>
<!-- <link rel="stylesheet" href="./css/select_user_style.css"> -->
</head>
<style>
.select{
	display: flex;
	flex-direction: column;
	margin:10px;
}

.select label{
	margin-top: 5%;
	font-weight: 30px;
	font-family: sans-serif;
	font-style: curs;
}

.select select{
	align-self: center;
}
</style>
<body>
<form action="storeToUserInSession.jsp">
<center>
<div class="select">
<label style="margin-top:10em;">Select User To transfer Money</label>
<select name="toUser" class="select" style="width:500px" id="select_customer">
<%try{
String email = request.getParameter("email");
session.setAttribute("email",email);
Connection con = ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs= st.executeQuery("select * from customer");
while(rs.next())
{%>
<option value="<%=rs.getString(2)%>"><%=rs.getString("name") %>&nbsp;&nbsp;<%=rs.getString("email") %></option>
<%} %>
<%} catch(Exception e){ %>
<center style="color:red;"><h1>Something went wrong</h1></center>
<%} %>
</select>
</div>
</center>
<center><button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #8080ff">Transfer</button></center>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <input type="number" name="amount" placeholder="Enter Amount" required>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <input type="submit" value="Transfer" class="btn btn-primary" style="background-color: #8080ff";>
      </div>
    </div>
  </div>
</div>
</form>
<!-- <script>
function passVal(){
	var toUser=document.getElementById("select_customer").value;
	var today = new Date();
	if(toUser!=null){
		sessionStorage.setItem("toUser",toUser);
		sessionStorage.setItem("date",today);
	}
}
</script> -->
</body>
</html>