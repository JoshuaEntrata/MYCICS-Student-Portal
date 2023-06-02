<%--
    Document   : signup
    Created on : May 4, 2023, 8:19:12 PM
    Author     : Dwight Kenneth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/all.min.css" />
    <link rel="stylesheet" href="signup.css" />
    <title>MyCICS Sign-up Page</title>
  </head>

  <body>
    <div class="container">
      <img src="./img/logo.png" />
      <h2>Sign Up</h2>
      <div class="content">
        <form action="SignupServlet">
          <div class="user-details">
            <div class="input-box">
              <label>Last Name</label>
              <input name="lname"type="text" required />
            </div>
            <div class="input-box">
              <label>First Name</label>
              <input name="fname"type="text" required />
            </div>
            <div class="input-box">
              <label>Middle Name</label>
              <input name="mname"type="text" placeholder="type 'N/A' if none" required />
            </div>
            <div class="input-box">
              <label>Birthday</label>
              <input name="bday" type="date" required />
            </div>
            <div class="input-box">
              <label>Password</label>
              <input name="pass"type="password" required />
            </div>
            <div class="input-box">
              <label>Confirm Password</label>
              <input name="cpass"type="password" placeholder="" required />
            </div>
          </div>

          <div class="role-details">
            <input type="radio" name="role" id="dot-1" value="Student" />
            <input type="radio" name="role" id="dot-2" value="Admin"/>
            <span class="role-title">Register as:</span>
            <div class="category">
              <label for="dot-1">
                <span class="dot one"></span>
                <span class="role">Student</span>
              </label>
              <label for="dot-2">
                <span class="dot two"></span>
                <span class="role">Admin</span>
              </label>
            </div>
          </div>
            
          <div class="button">
            <input type="submit" value="SIGN UP" />
          </div>

          <div class="account">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
          </div>
        </form>
      </div>
    </div>
  </body>
  
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
</html>