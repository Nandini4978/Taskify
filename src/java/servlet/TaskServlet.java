/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
// TaskServlet.java
package servlet;

import dao.TaskDAO;
import model.Task;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/task")
public class TaskServlet extends HttpServlet {
    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            HttpSession session = request.getSession();
            User user = (User ) session.getAttribute("user");

            if (user != null) {
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String status = "Pending"; // Default status

                Task newTask = new Task();
                newTask.setUserId(user.getId());
                newTask.setTitle(title);
                newTask.setDescription(description);
                newTask.setStatus(status);
                taskDAO.addTask(newTask);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
            
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User ) session.getAttribute("user");

        if (user != null) {
            if ("view".equals(action)) {
                int taskId = Integer.parseInt(request.getParameter("taskId"));
                Task task = taskDAO.getTaskById(taskId); // Fetch task by ID
                request.setAttribute("task", task);
                request.getRequestDispatcher("viewTask.jsp").forward(request, response);
            } else {
                List<Task> tasks = taskDAO.listTasks(user.getId()); // List tasks for the user
                request.setAttribute("tasks", tasks);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("index.jsp");
        }
        
        if ("update".equals(action)) 
        {
            int taskId = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String status = request.getParameter("status");

            Task task = new Task();
            task.setId(taskId);
            task.setTitle(title);
            task.setDescription(description);
            task.setStatus(status);

            taskDAO.updateTask(task); // Update the database
            response.sendRedirect("dashboard.jsp"); // Redirect back to the dashboard
        }

        else if ("delete".equals(action)) 
        {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            taskDAO.deleteTask(taskId); // Ensure this method exists in TaskDAO
            response.sendRedirect("dashboard.jsp");
        }

    }
}