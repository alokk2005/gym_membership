<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
    String planName = request.getParameter("plan_name");
    int duration = Integer.parseInt(request.getParameter("duration"));
    double price = Double.parseDouble(request.getParameter("price"));
    String desc = request.getParameter("description");

    String sql = "INSERT INTO plans (plan_name, duration_months, price, description) VALUES (?, ?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, planName);
    ps.setInt(2, duration);
    ps.setDouble(3, price);
    ps.setString(4, desc);

    int rows = ps.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<title>Plan Status</title>

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
        <h3>Plan added successfully! </h3>
        <a class="btn-link" href="plan_list.jsp">View Plans</a>
<%
    } else {
%>
        <h3>Error adding plan </h3>
        <a class="btn-link" href="plan_add.jsp">Try Again</a>
<%
    }
    ps.close();
    conn.close();
%>
</div>

</body>
</html>
