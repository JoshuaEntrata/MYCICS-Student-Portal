<%-- 
    Document   : admin-profile
    Created on : 17 May 2023, 2:48:20 pm
    Author     : JOSHUA KYLE
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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="student-profile.css" />
    <link rel="stylesheet" href="header-footer.css" />
    <title>Document</title>
  </head>
  <body>
      <%
                    session = request.getSession();
                    ArrayList results = (ArrayList) session.getAttribute("Aresultlist");
      %>
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

    <img class="profile-header" src="./img/ust.jpg" />
    <div class="page">
      <div class="profile">
        <div class="left">
          <img class="profile-pic" src="./img/jennie.jpg" />
          <h1><%= results.get(3) %> <%= results.get(2) %></h1>
        </div>
      </div>
      <div class="cards">
        <div class="main-card">
          <div class="card">
            <h3>Personal Information</h3>
            <table>
              <tr>
                <th>Employee Number</th>
                <td>:</td>
                <td><%= results.get(1) %></td>
              </tr>
              <tr>
                <th>Last Name</th>
                <td>:</td>
                <td><%= results.get(2) %></td>
              </tr>
              <tr>
                <th>First name</th>
                <td>:</td>
                <td><%= results.get(3) %></td>
              </tr>
              <tr>
                <th>Middle name</th>
                <td>:</td>
                <td><%= results.get(4) %></td>
              </tr>
              <tr>
                <th>Date of Birth</th>
                <td>:</td>
                <td><%= results.get(5) %></td>
              </tr>
              <tr>
                <th>Gender</th>
                <td>:</td>
                <td><%= results.get(6) %></td>
              </tr>
              <tr>
                <th>Marital Status</th>
                <td>:</td>
                <td><%= results.get(7) %></td>
              </tr>
              <tr>
                <th>Nationality</th>
                <td>:</td>
                <td><%= results.get(8) %></td>
              </tr>
              <tr>
                <th>Address</th>
                <td>:</td>
                <td><%= results.get(9) %></td>
              </tr>
              <tr>
                <th>Personal Email</th>
                <td>:</td>
                <td><%= results.get(10) %></td>
              </tr>
            </table>
          </div>
        </div>
        <div class="side-card">
          <div class="card">
            <h3>Work Information</h3>
            <table>
              <tr>
                <th>Company</th>
                <td>:</td>
                <td><%= results.get(11) %></td>
              </tr>
              <tr>
                <th>Department</th>
                <td>:</td>
                <td><%= results.get(12) %></td>
              </tr>
              <tr>
                <th>Company Email</th>
                <td>:</td>
                <td><%= results.get(13) %></td>
              </tr>
              <tr>
                <th>Employee Type</th>
                <td>:</td>
                <td><%= results.get(14) %></td>
              </tr>
              <tr>
                <th>Designation or Title</th>
                <td>:</td>
                <td><%= results.get(15) %></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div id="footer">
      <div class="footer container">
        <div class="brand">
          <h1>My<span>CICS</span> <span>S</span>tudent <span>P</span>ortal</h1>
        </div>
        <h2>An Online College Management System</h2>
        <p>Copyright © 2023 ICS2609 2CSC - Group 14. All rights reserved.</p>
      </div>
    </div>

    <script src="header-footer.js"></script>
  </body>
</html>
