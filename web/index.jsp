<%-- 
    Document   : index
    Created on : 26-Nov-2024, 8:20:23 pm
    Author     : key
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- index.jsp -->

<!DOCTYPE html>
<!-- Coding By Bhavsar Nandini-->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Task Management App</title>
  <!---Custom CSS File--->
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
    <input type="checkbox" id="check">
    <div class="login form">
      <header>Login</header>
      <form action="user?action=login" method="post">
          <input type="text" placeholder="Enter your Username" class="form-control" id="username" name="username" required>
        <input type="password" placeholder="Enter your password" id="password" name="password" required>
        <a href="#">Forgot password?</a>
        <input type="submit" class="button" value="Login">
         <!--<button type="submit" class="button">Login</button>-->
        <div>
            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">${error}</div>
            </c:if>
        </div>
      </form>
      <div class="signup">
        <span class="signup">Don't have an account?
         <label for="check">Signup</label>
        </span>
      </div>
    </div>
    <div class="registration form">
      <header>Sign Up</header>
      <form action="user?action=signup" method="post">
        <input type="text" placeholder="Enter your Username" class="form-control" id="username" name="username" required>
        <input type="password" placeholder="Create a password" class="form-control" id="password" name="password" required>
        <input type="submit" class="button" value="Signup">
      </form>
      <div class="signup">
        <span class="signup">Already have an account?
         <label for="check">Login</label>
        </span>
      </div>
    </div>
  </div>
</body>
</html>