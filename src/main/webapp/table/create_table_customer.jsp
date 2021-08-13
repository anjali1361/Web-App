<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% try{
 Connection con = ConnectionProvider.getCon();
 Statement st=con.createStatement();
 //String ql="create table customer(name varchar(100), email varchar(100) primary key,mobileNumber bigint,ifscCode bigint, accountNo bigint,accountBalance bigint)";
 String q2 = "create table transfer(fromUser varchar(100),toUser varchar(100),amountTransferred bigint, date datetime)";
 //System.out.print(ql);
 st.execute(q2);
 //String qI = "insert into customer values('Dipika','dipika@gmail.com',7926854671,33333,333333333333,30000),('Ruhi','ruhi@gmail.com',5356788578,44444,444444444444,50000),('Payal','payal@gmail.com',79268546711,44444,444444444444,70000),('Laxmi','laxmi@gmail.com',6754328901,44444,44444444444,90000),('Aaditi','aaditi@gmail.com',5409842167,55555,555555555555,70000)";
 //int count=st.executeUpdate(qI);
 //System.out.print(count+"rows affected");
 System.out.print("Table Created");
 con.close();
 }
catch(Exception e){
System.out.println(e);
}
%>
