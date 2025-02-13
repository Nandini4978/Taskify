<%-- 
    Document   : dashboard
    Created on : 26-Nov-2024, 8:19:52 pm
    Author     : key
--%>

<%@page import="model.Task"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    User user = (User) session.getAttribute("user");
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --background-color: #f8f9fa;
            --card-background: #ffffff;
            --text-primary: #333333;
            --text-secondary: #666666;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background-color);
            color: var(--text-primary);
        }

        header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 1.5rem 0;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .header-title {
            font-size: 1.8rem;
            font-weight: 600;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .dashboard-card {
            background: var(--card-background);
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        .welcome-section {
            text-align: center;
            margin-bottom: 2rem;
        }

        .welcome-title {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 1.5rem 0;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: var(--accent-color);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
        }

        th:first-child {
            border-top-left-radius: 10px;
        }

        th:last-child {
            border-top-right-radius: 10px;
        }

        tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin: 2rem 0;
        }

        .action-button {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 8px;
            background: var(--primary-color);
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .action-button:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
        }

        .logout-button {
            background: transparent;
            color: white;
            border: 1px solid white;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .logout-button:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--text-secondary);
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 1rem;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="header-title">
                <i class="fas fa-tasks"></i> Task Management Dashboard
            </div>
            <button onclick="location.href='logout.jsp'" class="logout-button">
                <i class="fas fa-sign-out-alt"></i> Logout
            </button>
        </div>
    </header>

    <div class="container">
        <div class="dashboard-card welcome-section">
            <h1 class="welcome-title">Welcome, <%= user.getUsername() %>!</h1>
            <p>Manage your tasks efficiently</p>
        </div>

        <div class="dashboard-card">
            <table>
                <tr>
                    <th><i class="fas fa-hashtag"></i> Task ID</th>
                    <th><i class="fas fa-heading"></i> Title</th>
                    <th><i class="fas fa-align-left"></i> Description</th>
                    <th><i class="fas fa-info-circle"></i> Status</th>
                </tr>
                <% if (tasks != null && !tasks.isEmpty()) {
                    for (Task task : tasks) { %>
                <tr>
                    <td>#<%= task.getId() %></td>
                    <td><%= task.getTitle() %></td>
                    <td><%= task.getDescription() %></td>
                    <td>
                        <span class="status-badge" style="background-color: #c8cdfc">
                            <%= task.getStatus() %>
                        </span>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="4" class="empty-state">
                        <i class="fas fa-inbox fa-2x"></i>
                        <p>No tasks found. Create your first task!</p>
                    </td>
                </tr>
                <% } %>
            </table>

            <div class="action-buttons">
                <button class="action-button" onclick="location.href='update-task.jsp'">
                    <i class="fas fa-edit"></i> Update Task
                </button>
                <button class="action-button" onclick="location.href='addTask.jsp'">
                    <i class="fas fa-plus"></i> Add Task
                </button>
                <button class="action-button" onclick="location.href='delete-task.jsp'">
                    <i class="fas fa-trash-alt"></i> Delete Task
                </button>
            </div>
        </div>
    </div>

    <script>
        function getStatusColor(status) {
            switch(status.toLowerCase()) {
                case 'completed':
                    return '#4ade80';
                case 'in progress':
                    return '#fbbf24';
                case 'pending':
                    return '#fb923c';
                default:
                    return '#94a3b8';
            }
        }
    </script>
</body>
</html>
