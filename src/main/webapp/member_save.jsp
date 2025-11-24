<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String address = request.getParameter("address");

    String sql = "INSERT INTO members (name, mobile, email, address, join_date) VALUES (?, ?, ?, ?, CURDATE())";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, mobile);
    ps.setString(3, email);
    ps.setString(4, address);

    int rows = ps.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<title>Member Status</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #74ebd5, #ACB6E5);
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .msg-box {
        background: #fff;
        padding: 30px 40px;
        width: 380px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0px 6px 20px rgba(0,0,0,0.25);
    }

    h3 {
        color: #333;
        margin-bottom: 20px;
    }

    .btn-link {
        display: inline-block;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        padding: 10px 15px;
        border-radius: 8px;
        font-size: 15px;
        transition: 0.3s ease;
    }

    .btn-link:hover {
        background-color: #45a049;
    }
</style>

</head>

<body>

<div class="msg-box">
<%
    if (rows > 0) {
%>
        <h3>Member registered successfully! 🎉</h3>
        <a class="btn-link" href="member_list.jsp">View Members</a>
<%
    } else {
%>
        <h3>Error in registration ❌</h3>
        <a class="btn-link" href="member_register.jsp">Try Again</a>
<%
    }
    ps.close();
    conn.close();
%>
</div>

</body>
</html>
