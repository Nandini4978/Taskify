<%-- 
    Document   : delete-task.jsp
    Created on : 28-Nov-2024, 4:30:56 pm
    Author     : key
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Task</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #FF7F50, #FF8C00);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #fff;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 90%;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #ff6347;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn {
            display: block;
            width: 100%;
            background: #ff6347;
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
            background: #ff4500;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            color: #ff6347;
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
        <h1>Are you sure you want to delete this task?</h1>
        <form action="task?action=delete" method="post">
            <div class="form-group">
                <label for="id">Task ID</label>
                <input type="text" id="id" name="id" value="<%= request.getAttribute("taskId") %>" readonly>
            </div>

            <button type="submit" class="btn">Delete Task</button>
        </form>
             <center>
        <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>
             </center>
    </div>
</body>
</html>
