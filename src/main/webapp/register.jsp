<!DOCTYPE html>
<html>
<head>
    <title>Register User</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 320px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #218838;
        }

        .view-btn {
            margin-top: 15px;
            text-align: center;
        }

        .view-btn a {
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .view-btn a:hover {
            background: #0056b3;
        }
    </style>

    <script>
        function validateForm() {
            let name = document.forms["regForm"]["name"].value;
            let email = document.forms["regForm"]["email"].value;
            let password = document.forms["regForm"]["password"].value;

            if (name.trim() === "") {
                alert("Name cannot be empty");
                return false;
            }

            if (!email.includes("@") || !email.includes(".")) {
                alert("Invalid email format");
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

<div class="container">
    <h2>User Registration</h2>

    <form name="regForm" action="register" method="post" onsubmit="return validateForm()">

        <label>Name</label>
        <input type="text" name="name" placeholder="Enter your name" required>

        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <button type="submit">Register</button>

    </form>

    <div class="view-btn">
        <a href="view">View Users</a>
    </div>
</div>

</body>
</html>