<%-- 
    Document   : login
    Created on : May 4, 2023, 8:03:37 PM
    Author     : Dwight Kenneth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/all.min.css" />
    <link rel="stylesheet" href="./login.css" />
    <title>MyCICS Login Page</title>
  </head>

  <body>
      <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache");//HTTP 1.0
            response.setHeader("Expires", "0");//Proxies

            boolean logIn = false;

            if (session.getAttribute("username") == null) {
                logIn = false;
            } else {
                logIn = true;
                Object uRole = session.getAttribute("role");
                String role = uRole.toString();
                if(role.equals("Student"))
                    {
                        response.sendRedirect("student-profile.jsp");
                    }
                else
                    {
                        response.sendRedirect("admin-profile.jsp");
                    }
            }
        %>
    <div class="container">
      <div class="left"></div>
      <div class="right">
        <img src="./img/logo.png" />
        <form action="LoginServlet" class="login-form">
          <div class="label-input">
            <label>Email Address</label>
            <input type="text" name="uname" placeholder="Enter your email address" required />
          </div>
          <div class="label-input">
            <label>Password</label>
            <input type="password" name="pass" placeholder="Enter your password" required />
          </div>
          <a href="forgot-pass.jsp">Forgot your password?</a>
          <button>LOGIN</button>
          <div class="account">
            <p>
              Don't have an account yet? <a href="signup.jsp" class="signup">Sign up</a>
            </p>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>