<%-- 
    Document   : logout
    Created on : 28-Nov-2024, 12:18:29 am
    Author     : key
--%>
<%@ page import="model.Task"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    User user = (User ) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaving Taskify</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
            background-color: #c8cdfc;
        }
        h1 {
            font-size: 3rem;
            color: #4c5fd7;
            margin-bottom: 20px;
        }
        h2 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 30px;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1.2rem;
            color: white;
            background-color: #4c5fd7;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #3946b8;
        }
        .footer {
            position: absolute;
            bottom: 10px;
            font-size: 1rem;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Leaving Taskify.....</h1>
        <h2>See you soon, <%= user.getUsername() %>!</h2>
        <a href="index.jsp">Login Again</a>
    </div>

    </body>
</html>
