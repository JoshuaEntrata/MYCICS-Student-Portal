<%-- 
    Document   : student-list
    Created on : May 5, 2023, 5:52:28 AM
    Author     : Dwight Kenneth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <%  
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
            response.setHeader("Pragma", "no-cache");//HTTP 1.0
            response.setHeader("Expires", "0");//Proxies

            boolean logIn = false;

            if (session.getAttribute("username") == null) {
                logIn = false;
                response.sendRedirect("index.jsp");
            } else {
                logIn = true;
            }
        %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="student-list.css" />
    <link rel="stylesheet" href="header-footer.css" />
    <title>MyCICS Student List</title> 
</head>

<body>
    <%
                    session = request.getSession();
                    ArrayList<ArrayList<String>> results = (ArrayList<ArrayList<String>>) session.getAttribute("Lresultlist");
      %>
    <!-- Header -->
    <div id="header">
      <div class="header container sl">
        <div class="nav-bar">
          <div class="brand">
            <a href="#hero">
              <h1>
                My<span>CICS</span> <span>S</span>tudent <span>P</span>ortal
              </h1>
            </a>
          </div>
          <div class="nav-list">
            <div class="hamburger">
              <div class="bar"></div>
            </div>
            <ul>
                <li><a href="DisplayServlet" data-after="Profile">List</a></li>
                <li><a href="admin-profile.jsp" data-after="Profile">Profile</a></li>
                <li><a href="LogoutServlet" data-after="Logout">Logout</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- End Header -->

    <!-- Student List -->
    <div class="page">
        <h1>Student List</h1>
        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Last Name</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Email Address</th>
                    <th>Password</th>
                    <th>Account Type</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>
                <%
                    for (int i = 0; i < results.size(); i++){
                    ArrayList<String> row = new ArrayList<String>();
                    row = results.get(i);
                %>
                <tr>
                    <td><a href="StudentFinderServlet?code=<%= row.get(1) %>"><%= row.get(1) %></a></td> 
                    <td><%= row.get(3) %></td>
                    <td><%= row.get(4) %></td>
                    <td><%= row.get(5) %></td>
                    <td><%= row.get(2) %></td>
                    <td><%= row.get(19) %></td>
                    <td><%= row.get(0) %></td>
                    <td>
                        <a href="DeleteStudentServlet?code=<%= row.get(1) %>">
                            &#10006;
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <div id="footer">
      <div class="footer container">
        <div class="brand">
          <h1>My<span>CICS</span> <span>S</span>tudent <span>P</span>ortal</h1>
        </div>
        <h2>An Online College Management System</h2>
        <p>Copyright © 2023 ICS2609 2CSC - Group 14. All rights reserved.</p>
      </div>
    </div>
    <!-- End Footer -->
    <script src="header-footer.js"></script>
</body>

</html>
