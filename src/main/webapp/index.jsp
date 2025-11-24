<!DOCTYPE html>
<html>
<head>
    <title>Gym Management System</title>

<style>
    body {
        font-family: "Poppins", Arial, sans-serif;
        background: linear-gradient(135deg, #4facfe, #00f2fe);
        height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }

    /* Animated floating circles background */
    body::before, body::after {
        content: "";
        position: absolute;
        width: 300px;
        height: 300px;
        background: rgba(255, 255, 255, 0.15);
        border-radius: 50%;
        animation: float 6s ease-in-out infinite;
    }

    body::after {
        width: 200px;
        height: 200px;
        right: 100px;
        bottom: 50px;
        animation-duration: 8s;
    }

    @keyframes float {
        0% { transform: translateY(0) }
        50% { transform: translateY(-25px) }
        100% { transform: translateY(0) }
    }

    .container {
        background: rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(15px);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0px 8px 25px rgba(0,0,0,0.25);
        text-align: center;
        width: 380px;
        animation: fadein 1.2s ease-in-out;
    }

    @keyframes fadein {
        from { opacity: 0; transform: translateY(40px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    h2 {
        margin-bottom: 25px;
        color: #fff;
        font-size: 26px;
        letter-spacing: 1px;
        text-shadow: 0px 3px 8px rgba(0,0,0,0.4);
    }

    a {
        display: block;
        background: linear-gradient(90deg, #43e97b, #38f9d7);
        color: white;
        font-weight: bold;
        padding: 14px;
        margin: 12px 0;
        border-radius: 10px;
        text-decoration: none;
        font-size: 17px;
        transition: 0.3s;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
        transform: scale(1);
    }

    a:hover {
        transform: scale(1.06);
        background: linear-gradient(90deg, #00c6ff, #0072ff);
        box-shadow: 0px 6px 20px rgba(0,0,0,0.35);
    }

    a:active {
        transform: scale(0.95);
    }
</style>
</head>

<body>

<div class="container">
    <h2>Gym Management System</h2>

    <a href="member_register.jsp">Register Member</a>
    <a href="member_list.jsp">View Members</a>

    <a href="plan_add.jsp">Add Plan</a>
    <a href="plan_list.jsp">View Plans</a>

    <a href="payment_add.jsp">Record Payment</a>
    <a href="payment_history.jsp">Payment History</a>
</div>

</body>
</html>
