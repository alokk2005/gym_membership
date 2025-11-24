<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Record Payment</title>

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

    .container {
        background: #ffffff;
        padding: 30px 40px;
        border-radius: 15px;
        width: 380px;
        box-shadow: 0px 6px 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-size: 15px;
        color: #333;
    }

    .input-box, select {
        width: 100%;
        padding: 10px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        box-sizing: border-box;
    }

    .btn-submit {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn-submit:hover {
        background-color: #45a049;
    }
</style>

</head>
<body>

<div class="container">
    <h2>Record Payment</h2>

    <form action="payment_save.jsp" method="post">

        <label>Member</label>
        <select name="member_id" class="input-box">
            <%
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT member_id, name FROM members");
                while (rs.next()) {
            %>
                <option value="<%= rs.getInt("member_id") %>">
                    <%= rs.getString("name") %>
                </option>
            <%
                }
                rs.close();
            %>
        </select>

        <label>Plan</label>
        <select name="plan_id" class="input-box">
            <%
                ResultSet rs2 = st.executeQuery("SELECT plan_id, plan_name FROM plans");
                while (rs2.next()) {
            %>
                <option value="<%= rs2.getInt("plan_id") %>">
                    <%= rs2.getString("plan_name") %>
                </option>
            <%
                }
                rs2.close();
                st.close();
            %>
        </select>

        <label>Amount</label>
        <input type="text" name="amount" required class="input-box">

        <label>Payment Mode</label>
        <input type="text" name="payment_mode" class="input-box">

        <button type="submit" class="btn-submit">Save Payment</button>
    </form>

</div>

</body>
</html>
