<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Plans</title>

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
        color: #ffffff;
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

<h2>All Subscription Plans</h2>

<table>
    <tr>
        <th>Plan ID</th>
        <th>Plan Name</th>
        <th>Duration (Months)</th>
        <th>Price</th>
        <th>Description</th>
    </tr>

<%
    String sql = "SELECT * FROM plans";
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(sql);

    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("plan_id") %></td>
        <td><%= rs.getString("plan_name") %></td>
        <td><%= rs.getInt("duration_months") %></td>
        <td><%= rs.getDouble("price") %></td>
        <td><%= rs.getString("description") %></td>
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
