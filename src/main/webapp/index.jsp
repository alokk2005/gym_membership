<!DOCTYPE html>
<html>
<head>
    <title>Gym Management System</title>
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

    .container {
        background: rgba(15, 23, 42, 0.7);
        backdrop-filter: blur(20px) saturate(180%);
        border: 1px solid rgba(255, 255, 255, 0.1);
        padding: 64px 56px;
        border-radius: 32px;
        box-shadow:
            0 20px 60px rgba(0, 0, 0, 0.4),
            inset 0 1px 0 rgba(255, 255, 255, 0.1);
        width: 680px;
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
    .container::after {
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
        border-radius: 24px;
        z-index: -1;
        opacity: 0;
        transition: opacity 0.5s;
    }

    .container:hover::after {
        opacity: 0.6;
        animation: glow-pulse 2s ease-in-out infinite;
    }

    @keyframes glow-pulse {
        0%, 100% { opacity: 0.4; }
        50% { opacity: 0.7; }
    }

    h2 {
        margin-bottom: 48px;
        background: linear-gradient(135deg, #10b981, #3b82f6, #8b5cf6);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        font-size: 42px;
        font-weight: 700;
        letter-spacing: -0.5px;
        animation: title-shimmer 3s ease-in-out infinite;
    }

    @keyframes title-shimmer {
        0%, 100% { filter: brightness(1); }
        50% { filter: brightness(1.2); }
    }

    .nav-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
    }

    a {
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.1),
            rgba(59, 130, 246, 0.1));
        border: 1px solid rgba(255, 255, 255, 0.1);
        color: #e2e8f0;
        font-weight: 600;
        padding: 24px 28px;
        border-radius: 16px;
        text-decoration: none;
        font-size: 17px;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        position: relative;
        overflow: hidden;
    }

    /* Animated gradient on hover */
    a::before {
        content: "";
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg,
            transparent,
            rgba(255, 255, 255, 0.1),
            transparent);
        transition: left 0.5s;
    }

    a:hover::before {
        left: 100%;
    }

    a:hover {
        transform: translateY(-4px) scale(1.02);
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.2),
            rgba(59, 130, 246, 0.2));
        border-color: rgba(255, 255, 255, 0.2);
        box-shadow:
            0 8px 25px rgba(16, 185, 129, 0.3),
            0 0 30px rgba(59, 130, 246, 0.2);
        color: #fff;
    }

    a:active {
        transform: translateY(-1px) scale(0.98);
    }

    /* Icon placeholders with gradient */
    a::after {
        content: " ";
        margin-left: 8px;
        font-size: 18px;
        opacity: 0;
        transform: translateX(-10px);
        transition: all 0.3s;
    }

    a:hover::after {
        opacity: 1;
        transform: translateX(0);
    }

    /* Responsive design */
    @media (max-width: 600px) {
        .container {
            width: 90%;
            padding: 36px 28px;
        }

        .nav-grid {
            grid-template-columns: 1fr;
        }

        h2 {
            font-size: 28px;
        }
    }

    /* Subtle sparkle effect */
    @keyframes sparkle {
        0%, 100% { opacity: 0; transform: scale(0); }
        50% { opacity: 1; transform: scale(1); }
    }

    .container::before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        background: white;
        border-radius: 50%;
        top: 20%;
        right: 15%;
        animation: sparkle 4s ease-in-out infinite;
    }
</style>
</head>

<body>
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>

    <div class="container">
        <h2>Gym Management System</h2>

        <div class="nav-grid">
            <a href="member_register.jsp">Register Member</a>
            <a href="member_list.jsp">View Members</a>
            <a href="plan_add.jsp">Add Plan</a>
            <a href="plan_list.jsp">View Plans</a>
            <a href="payment_add.jsp">Record Payment</a>
            <a href="payment_history.jsp">Payment History</a>
        </div>
    </div>

</body>
</html>