/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// TaskDAO.java

package dao;

import model.Task;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {
    private String jdbcURL = "jdbc:derby://localhost:1527/task_management";
    private String jdbcUsername = "Nandi"; // Change as needed
    private String jdbcPassword = "1311"; // Change as needed

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Method to add a new task
    public void addTask(Task task) {
        String sql = "INSERT INTO tasks (user_id, title, description, status) VALUES (?, ?, ?, ?)";
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, task.getUserId()); // Corrected method name
            statement.setString(2, task.getTitle());
            statement.setString(3, task.getDescription());
            statement.setString(4, task.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateTask(Task task) 
    {
    String sql = "UPDATE tasks SET title = ?, description = ?, status = ? WHERE id = ?";
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, task.getTitle());
        statement.setString(2, task.getDescription());
        statement.setString(3, task.getStatus());
        statement.setInt(4, task.getId());
        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }

    public void deleteTask(int taskId) 
    {
    String sql = "DELETE FROM tasks WHERE id = ?";
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setInt(1, taskId);
        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }


    public Task getTaskById(int taskId) {
        Task task = null;
        System.out.println("fetch");
        String sql = "SELECT * FROM NANDI.TASKS WHERE id = ?";

        try (Connection connection = getConnection(); // Corrected this line
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setInt(1, taskId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setUserId(resultSet.getInt("user_id")); // Corrected method name
                task.setTitle(resultSet.getString("title"));
                task.setDescription(resultSet.getString("description"));
                task.setStatus(resultSet.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }

        return task;
    }

    // Method to retrieve tasks for a specific user
    public List<Task> listTasks(int userId) {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT * FROM tasks WHERE user_id = ?";
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Task task = new Task();
                task.setId(resultSet.getInt("id"));
                task.setUserId(resultSet.getInt("user_id")); // Corrected method name
                task.setTitle(resultSet.getString("title"));
                task.setDescription(resultSet.getString("description"));
                task.setStatus(resultSet.getString("status"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
}


