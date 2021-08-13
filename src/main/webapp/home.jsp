<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<!-- <link rel="stylesheet" href="./css/home_style.css"> -->
</head>
<style>
body{
    background-image: url('./images/bg.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: 100% 100%;
}
.home_bg{
    width:100%;
	height:100%;
}
.home_bg img{
	margin-top:6%;
	margin-left: 12%;
}
.button{
	position:absolute;
	top:25%;
	right:15px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
}
.btn_sm{
	margin-top: 17px;
    margin-right: -68%;
    padding: 11px;
    background: transparent;
    width:15em;
    border: 2px solid #9e9696;
    border-radius:20px;
    text-decoration: none;
    color: white;
    text-align: center;
   
	
}

.btn_sm:hover {
	color:black;
	background-color:black;
	color:white;
	transform: translateX(10%);
	transition:0.8s;

}

</style>
<body>
<div class="home_bg">
<div class="button">
<a href="viewCustomer.jsp" class="btn_sm">View All Customers</a>
<a href="viewTransaction.jsp" class="btn_sm">View All Transactions</a>
</div>
</div>
</body>
</html>