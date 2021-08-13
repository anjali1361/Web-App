<%
String toEmail = request.getParameter("toUser");
String amountTransferred = request.getParameter("amount");
session.setAttribute("toEmail",toEmail);
session.setAttribute("amountTransferred",amountTransferred);
response.sendRedirect("storeTransactionToMySql.jsp");
%>