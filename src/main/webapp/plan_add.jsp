<!DOCTYPE html>
<html>
<head>
    <title>Add Plan</title>

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

    .input-box {
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
    <h2>Add Subscription Plan</h2>

    <form action="plan_save.jsp" method="post">

        <label>Plan Name</label>
        <input type="text" name="plan_name" required class="input-box">

        <label>Duration (months)</label>
        <input type="number" name="duration" required class="input-box">

        <label>Price</label>
        <input type="text" name="price" required class="input-box">

        <label>Description</label>
        <input type="text" name="description" class="input-box">

        <button type="submit" class="btn-submit">Save Plan</button>
    </form>
</div>

</body>
</html>
