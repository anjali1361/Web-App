<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import ="java.time.format.DateTimeFormatter" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<%
try{
String fromEmail = session.getAttribute("email").toString();
String toEmail = session.getAttribute("toEmail").toString();
int transferredAmount = Integer.parseInt(session.getAttribute("amountTransferred").toString());
Connection con = ConnectionProvider.getCon();
Statement stFrom = con.createStatement();
ResultSet rsFrom=stFrom.executeQuery("select * from customer where email='"+fromEmail+"'");
rsFrom.next();
String fromName = rsFrom.getString(1);
int fromBalance = rsFrom.getInt(6);

Statement stTo = con.createStatement();
ResultSet rsTo = stTo.executeQuery("select * from customer where email='"+toEmail+"'");
rsTo.next();
String toName=rsTo.getString(1);
int toBalance=rsTo.getInt(6);

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  

SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date date = new java.util.Date();
String str=dtf.format(now);

Statement ps=con.createStatement();
ps.executeUpdate("insert into transfer values('"+fromName+"','"+toName+"','"+transferredAmount+"','"+str+"')");

fromBalance-=transferredAmount;
toBalance+=transferredAmount;

stFrom.executeUpdate("update customer set accountBalance='"+fromBalance+"' where email='"+fromEmail+"'");
stTo.executeUpdate("update customer set accountBalance='"+toBalance+"' where email='"+toEmail+"'");

response.sendRedirect("viewTransaction.jsp?msg=successful");
}catch(Exception e){
response.sendRedirect("viewTransaction.jsp?msg=failed");
}
%>