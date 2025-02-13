<%-- 
    Document   : update-task.jsp
    Created on : 28-Nov-2024, 4:30:39 pm
    Author     : key
--%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Task</title>
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
        <h1>Update Task</h1>
        <form action="task?action=update" method="post">
            <div class="form-group">
                <label for="id">Task ID</label>
                <input type="text" id="id" name="id" value="<%= request.getAttribute("taskId") %>" readonly>
            </div>

            <div class="form-group">
                <label for="title">Task Title</label>
                <input type="text" id="title" name="title" value="<%= request.getAttribute("taskTitle") %>" required>
            </div>

            <div class="form-group">
                <label for="description">Task Description</label>
                <textarea id="description" name="description" rows="4" required><%= request.getAttribute("taskDescription") %></textarea>
            </div>

            <div class="form-group">
                <label for="status">Task Status</label>
                <select id="status" name="status" required>
                    <option value="Pending" <%= "Pending".equals(request.getAttribute("taskStatus")) ? "selected" : "" %>>Pending</option>
                    <option value="In Progress" <%= "In Progress".equals(request.getAttribute("taskStatus")) ? "selected" : "" %>>In Progress</option>
                    <option value="Completed" <%= "Completed".equals(request.getAttribute("taskStatus")) ? "selected" : "" %>>Completed</option>
                </select>
            </div>

            <button type="submit" class="btn">Update Task</button>
        </form>
                 <center>
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
                 </center>
    </div>
</body>
</html>