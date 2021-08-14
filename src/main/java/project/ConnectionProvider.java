package project;
import java.sql.*;
public class ConnectionProvider {
 public static Connection getCon()  {
	 try {
		 Class.forName("com.mysql.jdbc.Driver");//loading jdbc driver
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankwebapp","anjali1361","&&Ranjtee1640&&");
		 return con;
	 }catch(Exception e) {
		 System.out.print(e);
		 return null;
	 }
 }
}

