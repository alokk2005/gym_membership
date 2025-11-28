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
        display: flex;
        justify-content: center;
        align-items: center;
        overflow-x: hidden;
        position: relative;
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

    .msg-box {
        background: rgba(15, 23, 42, 0.7);
        backdrop-filter: blur(20px) saturate(180%);
        border: 1px solid rgba(255, 255, 255, 0.1);
        padding: 56px 48px;
        border-radius: 28px;
        box-shadow:
            0 20px 60px rgba(0, 0, 0, 0.4),
            inset 0 1px 0 rgba(255, 255, 255, 0.1);
        width: 480px;
        text-align: center;
        position: relative;
        z-index: 1;
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

    /* Glow effect on container */
    .msg-box::after {
        content: "";
        position: absolute;
        top: -2px;
        left: -2px;
        right: -2px;
        bottom: -2px;
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.5),
            rgba(59, 130, 246, 0.5),
            rgba(139, 92, 246, 0.5));
        border-radius: 28px;
        z-index: -1;
        opacity: 0.6;
        animation: glow-pulse 2s ease-in-out infinite;
    }

    @keyframes glow-pulse {
        0%, 100% { opacity: 0.4; }
        50% { opacity: 0.7; }
    }

    /* Success/Error icons */
    .status-icon {
        width: 80px;
        height: 80px;
        margin: 0 auto 24px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 48px;
        animation: iconPop 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }

    .success-icon {
        background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
        border: 2px solid rgba(16, 185, 129, 0.5);
        color: #10b981;
    }

    .error-icon {
        background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(239, 68, 68, 0.1));
        border: 2px solid rgba(239, 68, 68, 0.5);
        color: #ef4444;
    }

    @keyframes iconPop {
        0% {
            transform: scale(0);
            opacity: 0;
        }
        50% {
            transform: scale(1.1);
        }
        100% {
            transform: scale(1);
            opacity: 1;
        }
    }

    h3 {
        background: linear-gradient(135deg, #10b981, #3b82f6);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 16px;
        letter-spacing: -0.5px;
    }

    .error-title {
        background: linear-gradient(135deg, #ef4444, #dc2626);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .message-text {
        color: #94a3b8;
        font-size: 15px;
        margin-bottom: 32px;
        line-height: 1.6;
    }

    .btn-link {
        display: inline-block;
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.9),
            rgba(59, 130, 246, 0.9));
        color: white;
        text-decoration: none;
        padding: 14px 28px;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        position: relative;
        overflow: hidden;
        margin: 0 8px;
    }

    .btn-link::before {
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

    .btn-link:hover::before {
        left: 100%;
    }

    .btn-link:hover {
        transform: translateY(-2px);
        box-shadow:
            0 8px 25px rgba(16, 185, 129, 0.4),
            0 0 30px rgba(59, 130, 246, 0.3);
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 1),
            rgba(59, 130, 246, 1));
    }

    .btn-link:active {
        transform: translateY(0);
    }

    .btn-secondary {
        background: rgba(255, 255, 255, 0.1);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .btn-secondary:hover {
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
    }

    /* Button container */
    .btn-container {
        display: flex;
        gap: 12px;
        justify-content: center;
        flex-wrap: wrap;
    }

    /* Responsive design */
    @media (max-width: 600px) {
        .msg-box {
            width: 90%;
            padding: 40px 32px;
        }

        h3 {
            font-size: 24px;
        }

        .status-icon {
            width: 70px;
            height: 70px;
            font-size: 40px;
        }

        .btn-container {
            flex-direction: column;
        }

        .btn-link {
            margin: 0;
        }
    }

    /* Checkmark and X icons using CSS */
    .checkmark {
        display: inline-block;
        transform: rotate(45deg);
        height: 40px;
        width: 20px;
        border-bottom: 6px solid #10b981;
        border-right: 6px solid #10b981;
    }

    .xmark {
        position: relative;
        width: 40px;
        height: 40px;
        display: inline-block;
    }

    .xmark::before,
    .xmark::after {
        content: '';
        position: absolute;
        width: 6px;
        height: 40px;
        background: #ef4444;
        left: 50%;
        transform: translateX(-50%);
    }

    .xmark::before {
        transform: translateX(-50%) rotate(45deg);
    }

    .xmark::after {
        transform: translateX(-50%) rotate(-45deg);
    }
</style>

</head>

<body>
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>

    <div class="msg-box">
<%
    if (rows > 0) {
%>
        <div class="status-icon success-icon">
            <div class="checkmark"></div>
        </div>
        <h3>Plan Added Successfully!</h3>
        <p class="message-text">The subscription plan has been successfully added to the system.</p>
        <div class="btn-container">
            <a class="btn-link" href="plan_list.jsp">View Plans</a>
            <a class="btn-link btn-secondary" href="plan_add.jsp">Add Another</a>
        </div>
<%
    } else {
%>
        <div class="status-icon error-icon">
            <div class="xmark"></div>
        </div>
        <h3 class="error-title">Plan Creation Failed</h3>
        <p class="message-text">An error occurred while adding the plan. Please try again.</p>
        <div class="btn-container">
            <a class="btn-link" href="plan_add.jsp">Try Again</a>
            <a class="btn-link btn-secondary" href="index.jsp">Go to Home</a>
        </div>
<%
    }
    ps.close();
    conn.close();
%>
    </div>

</body>
</html>