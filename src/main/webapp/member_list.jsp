<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Member List</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: "Inter", -apple-system, BlinkMacSystemFont, sans-serif;
        background: #0a0e27;
        min-height: 100vh;
        padding: 40px 20px;
        position: relative;
        overflow-x: hidden;
    }

    /* Animated gradient background */
    body::before {
        content: "";
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background:
            radial-gradient(ellipse at 20% 30%, rgba(16, 185, 129, 0.15) 0%, transparent 50%),
            radial-gradient(ellipse at 80% 70%, rgba(59, 130, 246, 0.15) 0%, transparent 50%),
            radial-gradient(ellipse at 50% 50%, rgba(139, 92, 246, 0.1) 0%, transparent 60%);
        animation: gradient-shift 15s ease infinite;
        z-index: 0;
    }

    @keyframes gradient-shift {
        0%, 100% { opacity: 1; transform: scale(1); }
        50% { opacity: 0.8; transform: scale(1.1); }
    }

    /* Floating orbs */
    .orb {
        position: fixed;
        border-radius: 50%;
        filter: blur(60px);
        opacity: 0.6;
        animation: float-orb 20s ease-in-out infinite;
        z-index: 0;
    }

    .orb-1 {
        width: 400px;
        height: 400px;
        background: radial-gradient(circle, rgba(16, 185, 129, 0.3), transparent);
        top: -100px;
        left: -100px;
        animation-delay: 0s;
    }

    .orb-2 {
        width: 350px;
        height: 350px;
        background: radial-gradient(circle, rgba(59, 130, 246, 0.3), transparent);
        bottom: -80px;
        right: -80px;
        animation-delay: 7s;
    }

    .orb-3 {
        width: 300px;
        height: 300px;
        background: radial-gradient(circle, rgba(139, 92, 246, 0.25), transparent);
        top: 50%;
        right: 10%;
        animation-delay: 14s;
    }

    @keyframes float-orb {
        0%, 100% { transform: translate(0, 0) scale(1); }
        33% { transform: translate(30px, -30px) scale(1.1); }
        66% { transform: translate(-20px, 20px) scale(0.9); }
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        position: relative;
        z-index: 1;
    }

    h2 {
        text-align: center;
        margin-bottom: 40px;
        background: linear-gradient(135deg, #10b981, #3b82f6, #8b5cf6);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        font-size: 38px;
        font-weight: 700;
        letter-spacing: -0.5px;
        animation: title-shimmer 3s ease-in-out infinite;
    }

    @keyframes title-shimmer {
        0%, 100% { filter: brightness(1); }
        50% { filter: brightness(1.2); }
    }

    .table-wrapper {
        background: rgba(15, 23, 42, 0.7);
        backdrop-filter: blur(20px) saturate(180%);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 20px;
        padding: 0;
        box-shadow:
            0 20px 60px rgba(0, 0, 0, 0.4),
            inset 0 1px 0 rgba(255, 255, 255, 0.1);
        overflow: hidden;
        animation: container-entrance 0.8s cubic-bezier(0.16, 1, 0.3, 1);
    }

    @keyframes container-entrance {
        from {
            opacity: 0;
            transform: translateY(30px) scale(0.95);
        }
        to {
            opacity: 1;
            transform: translateY(0) scale(1);
        }
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.2),
            rgba(59, 130, 246, 0.2));
        color: #10b981;
        padding: 18px 20px;
        font-size: 15px;
        font-weight: 600;
        text-align: left;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    td {
        padding: 16px 20px;
        color: #e2e8f0;
        font-size: 15px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    }

    tr {
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    tbody tr:hover {
        background: rgba(16, 185, 129, 0.08);
        transform: scale(1.01);
    }

    tbody tr:last-child td {
        border-bottom: none;
    }

    .back-btn {
        display: block;
        width: 220px;
        margin: 30px auto 0;
        padding: 16px;
        text-align: center;
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.9),
            rgba(59, 130, 246, 0.9));
        color: white;
        text-decoration: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        position: relative;
        overflow: hidden;
    }

    .back-btn::before {
        content: "";
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg,
            transparent,
            rgba(255, 255, 255, 0.2),
            transparent);
        transition: left 0.5s;
    }

    .back-btn:hover::before {
        left: 100%;
    }

    .back-btn:hover {
        transform: translateY(-2px);
        box-shadow:
            0 8px 25px rgba(16, 185, 129, 0.4),
            0 0 30px rgba(59, 130, 246, 0.3);
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 1),
            rgba(59, 130, 246, 1));
    }

    .back-btn:active {
        transform: translateY(0);
    }

    .back-btn::after {
        content: " ";
        margin-right: 8px;
        font-size: 18px;
    }

    /* Empty state */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #94a3b8;
        font-size: 16px;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        body {
            padding: 20px 10px;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 24px;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            min-width: 600px;
        }

        th, td {
            padding: 12px 14px;
            font-size: 14px;
        }
    }

    /* Loading animation for rows */
    tbody tr {
        animation: fadeInRow 0.5s ease-out forwards;
        opacity: 0;
    }

    tbody tr:nth-child(1) { animation-delay: 0.1s; }
    tbody tr:nth-child(2) { animation-delay: 0.15s; }
    tbody tr:nth-child(3) { animation-delay: 0.2s; }
    tbody tr:nth-child(4) { animation-delay: 0.25s; }
    tbody tr:nth-child(5) { animation-delay: 0.3s; }
    tbody tr:nth-child(n+6) { animation-delay: 0.35s; }

    @keyframes fadeInRow {
        from {
            opacity: 0;
            transform: translateX(-20px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }
</style>
</head>

<body>
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>

    <div class="container">
        <h2>All Members</h2>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Mobile</th>
                        <th>Email</th>
                        <th>Join Date</th>
                    </tr>
                </thead>
                <tbody>
<%
    try {
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM members");
        boolean hasRecords = false;

        while (rs.next()) {
            hasRecords = true;
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

        if (!hasRecords) {
%>
                    <tr>
                        <td colspan="5" class="empty-state">No members found. Start by registering a new member!</td>
                    </tr>
<%
        }

        rs.close();
        st.close();
        conn.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='5' class='empty-state'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
                </tbody>
            </table>
        </div>

        <a href="index.jsp" class="back-btn">Back to Home</a>
    </div>

</body>
</html>