<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<%
    int memberId = Integer.parseInt(request.getParameter("member_id"));
    int planId = Integer.parseInt(request.getParameter("plan_id"));
    double amount = Double.parseDouble(request.getParameter("amount"));
    String mode = request.getParameter("payment_mode");

    String sql = "INSERT INTO payments (member_id, plan_id, payment_date, amount, payment_mode) VALUES (?, ?, CURDATE(), ?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, memberId);
    ps.setInt(2, planId);
    ps.setDouble(3, amount);
    ps.setString(4, mode);

    int rows = ps.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
<title>Payment Status</title>

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
        <h3>Payment recorded successfully! </h3>
        <a class="btn-link" href="payment_history.jsp">View Payment History</a>
<%
    } else {
%>
        <h3>Error saving payment </h3>
        <a class="btn-link" href="payment_add.jsp">Try Again</a>
<%
    }
    ps.close();
    conn.close();
%>
</div>

</body>
</html>
