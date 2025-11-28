<!DOCTYPE html>
<html>
<head>
    <title>Add Plan</title>
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
        padding: 48px 44px;
        border-radius: 28px;
        box-shadow:
            0 20px 60px rgba(0, 0, 0, 0.4),
            inset 0 1px 0 rgba(255, 255, 255, 0.1);
        width: 520px;
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
        border-radius: 28px;
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
        text-align: center;
        margin-bottom: 36px;
        background: linear-gradient(135deg, #10b981, #3b82f6, #8b5cf6);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
        font-size: 32px;
        font-weight: 700;
        letter-spacing: -0.5px;
        animation: title-shimmer 3s ease-in-out infinite;
    }

    @keyframes title-shimmer {
        0%, 100% { filter: brightness(1); }
        50% { filter: brightness(1.2); }
    }

    label {
        font-size: 14px;
        font-weight: 500;
        color: #94a3b8;
        margin-bottom: 8px;
        display: block;
        letter-spacing: 0.3px;
    }

    .input-box, select {
        width: 100%;
        padding: 14px 16px;
        margin-bottom: 20px;
        background: rgba(15, 23, 42, 0.6);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 12px;
        font-size: 15px;
        color: #e2e8f0;
        font-family: inherit;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    }

    select {
        cursor: pointer;
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%2394a3b8' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 16px center;
        padding-right: 40px;
    }

    select option {
        background: #1e293b;
        color: #e2e8f0;
        padding: 10px;
    }

    .input-box:focus, select:focus {
        outline: none;
        border-color: rgba(16, 185, 129, 0.5);
        background: rgba(15, 23, 42, 0.8);
        box-shadow:
            0 0 0 3px rgba(16, 185, 129, 0.1),
            0 4px 12px rgba(0, 0, 0, 0.3);
        transform: translateY(-1px);
    }

    .input-box[readonly] {
        background: rgba(15, 23, 42, 0.4);
        cursor: not-allowed;
        color: #94a3b8;
    }

    .input-box::placeholder {
        color: #64748b;
    }

    .btn-submit {
        width: 100%;
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 0.9),
            rgba(59, 130, 246, 0.9));
        color: white;
        padding: 16px;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        position: relative;
        overflow: hidden;
        margin-top: 12px;
    }

    /* Animated gradient on hover */
    .btn-submit::before {
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

    .btn-submit:hover::before {
        left: 100%;
    }

    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow:
            0 8px 25px rgba(16, 185, 129, 0.4),
            0 0 30px rgba(59, 130, 246, 0.3);
        background: linear-gradient(135deg,
            rgba(16, 185, 129, 1),
            rgba(59, 130, 246, 1));
    }

    .btn-submit:active {
        transform: translateY(0);
    }

    /* Back button */
    .back-link {
        display: inline-block;
        margin-bottom: 20px;
        color: #94a3b8;
        text-decoration: none;
        font-size: 14px;
        font-weight: 500;
        transition: all 0.3s;
        padding: 8px 16px;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.05);
    }

    .back-link:hover {
        color: #10b981;
        background: rgba(16, 185, 129, 0.1);
        transform: translateX(-4px);
    }

    .back-link::before {
        content: " ";
        margin-right: 4px;
    }

    /* Plan badge animation */
    .plan-info {
        display: flex;
        gap: 12px;
        margin-bottom: 20px;
    }

    .info-badge {
        flex: 1;
        background: rgba(16, 185, 129, 0.1);
        border: 1px solid rgba(16, 185, 129, 0.3);
        padding: 12px;
        border-radius: 10px;
        text-align: center;
        animation: fadeIn 0.5s ease-out;
    }

    .info-badge .label {
        font-size: 12px;
        color: #94a3b8;
        display: block;
        margin-bottom: 4px;
    }

    .info-badge .value {
        font-size: 18px;
        font-weight: 600;
        color: #10b981;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Responsive design */
    @media (max-width: 600px) {
        .container {
            width: 90%;
            padding: 36px 28px;
        }

        h2 {
            font-size: 28px;
        }

        .plan-info {
            flex-direction: column;
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
        z-index: 1;
    }
</style>

<script>
function updatePlanDetails() {
    let plan = document.getElementById("planSelect").value;
    let priceBox = document.getElementById("priceBox");
    let durationBox = document.getElementById("durationBox");

    if (plan === "Monthly") {
        durationBox.value = 1;
        priceBox.value = 1500;
    }
    else if (plan === "Annual") {
        durationBox.value = 12;
        priceBox.value = 18000;
    }
    else if (plan === "Class-based") {
        durationBox.value = 12;
        priceBox.value = 20000;
    }
    else if (plan === "Premium") {
        durationBox.value = 12;
        priceBox.value = 30000;
    }
    else {
        durationBox.value = "";
        priceBox.value = "";
    }
}
</script>

</head>

<body>
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>

    <div class="container">
        <a href="index.jsp" class="back-link">Back to Home</a>

        <h2>Add Subscription Plan</h2>

        <form action="plan_save.jsp" method="post">

            <label>Plan Name</label>
            <select name="plan_name" id="planSelect" required onchange="updatePlanDetails()">
                <option value="">-- Select Plan --</option>
                <option value="Monthly">Monthly</option>
                <option value="Annual">Annual</option>
                <option value="Class-based">Class-based</option>
                <option value="Premium">Premium</option>
            </select>

            <label>Duration (months)</label>
            <input type="number" name="duration" id="durationBox" required class="input-box" readonly placeholder="Auto-filled">

            <label>Price</label>
            <input type="text" name="price" id="priceBox" required class="input-box" readonly placeholder="Auto-filled">

            <label>Description</label>
            <input type="text" name="description" class="input-box" placeholder="Optional description">

            <button type="submit" class="btn-submit">Save Plan</button>
        </form>
    </div>

</body>
</html>