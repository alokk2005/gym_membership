<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Payment History</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #74ebd5, #ACB6E5);
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        background: #ffffff;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
        border-radius: 10px;
        overflow: hidden;
    }

    th {
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        font-size: 16px;
        text-align: center;
    }

    td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-size: 15px;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .back-btn {
        display: block;
        width: 200px;
        margin: 25px auto;
        padding: 12px;
        text-align: center;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-size: 16px;
        transition: 0.3s;
    }

    .back-btn:hover {
        background-color: #45a049;
    }
</style>

</head>

<body>

<h2>Payment History</h2>

<table>
    <tr>
        <th>Payment ID</th>
        <th>Member</th>
        <th>Plan</th>
        <th>Date</th>
        <th>Amount</th>
        <th>Mode</th>
    </tr>

<%
    String sql = "SELECT p.payment_id, m.name, pl.plan_name, p.payment_date, p.amount, p.payment_mode " +
                 "FROM payments p " +
                 "JOIN members m ON p.member_id = m.member_id " +
                 "JOIN plans pl ON p.plan_id = pl.plan_id";

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);

    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("payment_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("plan_name") %></td>
        <td><%= rs.getDate("payment_date") %></td>
        <td><%= rs.getDouble("amount") %></td>
        <td><%= rs.getString("payment_mode") %></td>
    </tr>
<%
    }
    rs.close();
    st.close();
    conn.close();
%>

</table>

<a href="index.jsp" class="back-btn">Back to Home</a>

</body>
</html>
