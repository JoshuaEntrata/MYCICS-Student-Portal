<%-- 
    Document   : student-edit
    Created on : 17 May 2023, 2:47:01 pm
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
    <link
      rel="stylesheet"
      href="path/to/font-awesome/css/font-awesome.min.css"
    />
    <title>Edit Profile</title>
  </head>
  <body>
      <%
                    session = request.getSession();
                    ArrayList results = (ArrayList) session.getAttribute("Sresultlist");
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
              <li><a href="LogoutServlet" data-after="Logout">Logout</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <img class="profile-header" src="./img/ust.jpg" />
    <div class="page">
    <form method="Post" action="UpdateServlet">
      <div class="profile">
        <div class="left">
          <img class="profile-pic" src="./img/jennie.jpg" />
          <h1><%= results.get(4) %> <%= results.get(3) %></h1>
        </div>
        <div class="right">
           
          <button type="button" class="cancel" onclick="goBack()">Cancel</button>
          <button class="save">Save</button> 
           
        </div>
      </div>
          
      <div class="cards">
        <div class="main-card">
          <div class="card">
            <h3>Personal Information</h3>
            <table>
              <tr>
                <th>Student Number</th>
                <td>:</td>
                <td placeholder="<%= results.get(1) %>"></td>
              </tr> 
              <tr>
                <th>Email Address</th>
                <td>:</td>
                <td placeholder="<%= results.get(2) %>"></td>
              </tr>
              <tr>
                <th>Last Name</th>
                <td>:</td>
                <td><input name="LNam" type="text" placeholder="<%= results.get(3) %>"/></td>
              </tr>
              <tr>
                <th>First name</th>
                <td>:</td>
                <td><input name="FNam"type="text" placeholder="<%= results.get(4) %>"/></td>
              </tr>
              <tr>
                <th>Middle name</th>
                <td>:</td>
                <td><input name="MNam" type="text" placeholder="<%= results.get(5) %>"/></td>
              </tr>
              <tr>
                <th>Date of Birth</th>
                <td>:</td>
                <td><input name="DOB" type="date" placeholder="<%= results.get(6) %>"/></td>
              </tr>
              <tr>
                <th>Gender</th>
                <td>:</td>
                <td>
                    <select name="Gen" id="dropdown">
                        <option value="">-</option>
                        <option value="Male" <%= results.get(7).equals("Male") ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= results.get(7).equals("Female") ? "selected" : "" %>>Female</option>
                    </select>
                </td>
              </tr>
              <tr>
                <th>Address</th>
                <td>:</td>
                <td><input name="Add" type="text" placeholder="<%= results.get(8) %>"/></td>
              </tr>
            </table>
          </div>
        </div>
        <div class="side-card">
          <div class="card">
            <h3>Course Information</h3>
            <table>
              <tr>
                <th>Degree</th>
                <td>:</td>
                <td>
                    <select name="Deg" id="dropdown">
                        <option value="">-</option>
                        <option value="BS Computer Science" <%= results.get(9).equals("BS Computer Science") ? "selected" : "" %>>BS Computer Science</option>
                        <option value="BS Information Systems" <%= results.get(9).equals("BS Information Systems") ? "selected" : "" %>>BS Information Systems</option>
                        <option value="BS Information Technology" <%= results.get(9).equals("BS Information Technology") ? "selected" : "" %>>BS Information Technology</option>
                    </select>
                </td>
              </tr>
              <tr>
                <th>Specialization Track</th>
                <td>:</td>
                <td>
                    <select name="STra" id="dropdown">
                        <option value="">-</option>
                        <option value="CS - Core Computer Science" <%= results.get(10).equals("CS - Core Computer Science") ? "selected" : "" %>>CS - Core Computer Science</option>
                        <option value="CS - Game Development" <%= results.get(10).equals("CS - Game Development") ? "selected" : "" %>>CS - Game Development</option>
                        <option value="CS - Data Science" <%= results.get(10).equals("CS - Data Science") ? "selected" : "" %>>CS - Data Science</option>
                        <option value="IT - Network and Security" <%= results.get(10).equals("IT - Network and Security") ? "selected" : "" %>>IT - Network and Security</option>
                        <option value="IT - Web and Mobile App Development" <%= results.get(10).equals("IT - Web and Mobile App Development") ? "selected" : "" %>>IT - Web and Mobile App Development</option>
                        <option value="IT - IT Automation" <%= results.get(10).equals("IT - IT Automation") ? "selected" : "" %>>IT - IT Automation</option>
                        <option value="IS - Business Analytics" <%= results.get(10).equals("IS - Business Analytics") ? "selected" : "" %>>IS - Business Analytics</option>
                        <option value="IS - Service Management" <%= results.get(10).equals("IS - Service Management") ? "selected" : "" %>>IS - Service Management</option>
                    </select>
                </td>
              </tr>
              <tr>
                <th>Status</th>
                <td>:</td>
                <td>
                    <select name="Sta" id="dropdown">
                        <option value="">-</option>
                        <option value="On-going" <%= results.get(11).equals("On-going") ? "selected" : "" %>>On-going</option>
                        <option value="Discontinued" <%= results.get(11).equals("Discontinued") ? "selected" : "" %>>Discontinued</option>
                        <option value="Finished" <%= results.get(11).equals("Finished") ? "selected" : "" %>>Finished</option>
                    </select>
                </td>
              </tr>
            </table>
          </div>

          <div class="card">
            <h3>Parent/Guardian Information</h3>
            <table>
              <tr>
                <th>Father</th>
                <td>:</td>
                <td><input name="Fat" type="text" placeholder="<%= results.get(12) %>"/></td>
              </tr>
              <tr>
                <th>Mother</th>
                <td>:</td>
                <td><input name="Mot" type="text" placeholder="<%= results.get(13) %>"/></td>
              </tr>
              <tr>
                <th>Address (Parent)</th>
                <td>:</td>
                <td><input name="APar" type="text" placeholder="<%= results.get(14) %>"/></td>
              </tr>
              <tr>
                <th>Contact No. (Parent)</th>
                <td>:</td>
                <td><input name="CPar" type="text" placeholder="<%= results.get(15) %>" pattern="[0-9]*"/></td>
              </tr>
              <tr>
                <th>Guardian</th>
                <td>:</td>
                <td><input name="Gua" type="text" placeholder="<%= results.get(16) %>"/></td>
              </tr>
              <tr>
                <th>Address (Guardian)</th>
                <td>:</td>
                <td><input name="AGua"type="text" placeholder="<%= results.get(17) %>"/></td>
              </tr>
              <tr>
                <th>Contact No. (Guardian)</th>
                <td>:</td>
                <td><input name="CGua" type="text" placeholder="<%= results.get(18) %>" pattern="[0-9]*"/></td>
              </tr>
            </table>
            
          </div>
           
        </div>
         
      </div>
    </form>
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
              
    <script>
        // Function to go back to the previous page
        function goBack() {
          window.history.back();
        }
      </script>
    <script src="header-footer.js"></script>
    
    <script>
        var inputs = document.querySelectorAll('input[type="text"]');

        inputs.forEach(function(input) {
            input.addEventListener('blur', function() {
                var words = this.value.split(" ");
                var capitalizedWords = [];

                for (var i = 0; i < words.length; i++) {
                    var word = words[i].toLowerCase();
                    var capitalizedWord = word.charAt(0).toUpperCase() + word.slice(1);
                    capitalizedWords.push(capitalizedWord);
                }

                this.value = capitalizedWords.join(" ");
            });
        });
    </script>


  </body>
</html>
