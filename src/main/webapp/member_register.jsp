<!DOCTYPE html>
<html>
<head>
    <title>Member Registration</title>

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
        font-size: 15px;
        color: #333;
        margin-bottom: 5px;
        display: block;
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
    <h2>Gym Member Registration</h2>

    <form action="member_save.jsp" method="post">

        <label>Name</label>
        <input type="text" name="name" required class="input-box">

        <label>Mobile</label>
        <input type="text" name="mobile" required class="input-box">

        <label>Email</label>
        <input type="email" name="email" class="input-box">

        <label>Address</label>
        <input type="text" name="address" class="input-box">

        <button type="submit" class="btn-submit">Register</button>

    </form>
</div>

</body>
</html>
