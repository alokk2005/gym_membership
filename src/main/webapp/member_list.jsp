<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
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
        background: #fff;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
        border-radius: 10px;
        overflow: hidden;
    }

    th {
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        font-size: 16px;
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

<h2>All Members</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Mobile</th>
        <th>Email</th>
        <th>Join Date</th>
    </tr>

<%
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM members");
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("member_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("mobile") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getDate("join_date") %></td>
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
