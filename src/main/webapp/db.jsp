<%@ page import="java.sql.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/gym_db";
    String user = "root";
    String password = "0124";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, password);
%>
