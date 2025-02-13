<%-- 
    Document   : addTask
    Created on : 26-Nov-2024, 8:21:25 pm
    Author     : key
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import=" model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    User user = (User ) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Task</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #8F99FB, #D8E4FF);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 90%;
        }

        h1 {
            text-align: center;
            color: #4c5fd7;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: box-shadow 0.3s ease;
        }

        input:focus, textarea:focus, select:focus {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        textarea {
            resize: vertical;
        }

        .btn {
            display: block;
            width: 100%;
            background: #4c5fd7;
            color: #fff;
            font-size: 1.2rem;
            font-weight: 500;
            padding: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #3946b8;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            color: #4c5fd7;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Task</h1>
        <div style="text-align: center; margin-bottom: 20px;">
            <img src="https://img.icons8.com/color/96/000000/task.png" alt="Task Icon" style="width: 80px; height: 80px;">
        </div>
        
        
        <form action="task?action=add" method="post">
            <div class="form-group">
                <label for="title">Task Title</label>
                <input type="text" id="title" name="title" placeholder="Enter task title" required>
            </div>
            
            <div class="form-group">
                <label for="description">Task Description</label>
                <textarea id="description" name="description" placeholder="Enter task details" rows="4" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="status">Task Status</label>
                <select id="status" name="status" required>
                    <option value="Pending">Pending</option>
                    <option value="In Progress">In Progress</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>
            
            <button type="submit" class="btn">Add Task</button>
        </form>
        <center>
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
        </center>
    </div>
</body>
</html>
