<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            padding: 40px;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            max-width: 800px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background: #333;
            color: white;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        .edit-btn {
            background: orange;
        }

        .edit-btn:hover {
            background: darkorange;
        }

        .delete-btn {
            background: red;
        }

        .delete-btn:hover {
            background: darkred;
        }

        .add-btn {
            display: block;
            width: 150px;
            margin: 20px auto;
            text-align: center;
            background: #007bff;
        }

        .add-btn:hover {
            background: #0056b3;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>User List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
            List<String[]> users = (List<String[]>) request.getAttribute("userList");

            if (users != null) {
                for (String[] user : users) {
        %>

        <tr>
            <td><%= user[0] %></td>
            <td><%= user[1] %></td>
            <td><%= user[2] %></td>

            <td>
                <a href="edit?id=<%= user[0] %>" class="btn edit-btn">
                    Edit
                </a>
            </td>

            <td>
                <a href="delete?id=<%= user[0] %>" class="btn delete-btn"
                   onclick="return confirm('Are you sure you want to delete this user?');">
                    Delete
                </a>
            </td>
        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="5">No users found</td>
        </tr>

        <%
            }
        %>

    </table>

    <a href="register.jsp" class="btn add-btn">Add New User</a>

</div>

</body>
</html>