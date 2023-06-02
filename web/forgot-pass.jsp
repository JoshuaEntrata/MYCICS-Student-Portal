<%-- 
    Document   : forgot-pass
    Created on : May 5, 2023, 5:42:31 AM
    Author     : Dwight Kenneth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/all.min.css" />
    <link rel="stylesheet" href="./forgot-pass.css" />
    <title>MyCICS Forgot Password Page</title>
  </head>

  <body>
    <div class="container">
      <img src="./img/logo.png" />
      <h2>Forgot Password?</h2>
      <form action="ForgotPassServlet" class="change-pass">
        <div class="label-input">
          <input type="text" placeholder="Email Address" name="uname"required />
        </div>
        <div class="label-input">
          <input type="password" placeholder="Password" name="pass"required />
        </div>
        <div class="label-input">
          <input type="password" placeholder="Confirm Password" name="cpass"required />
        </div>
        <button>CHANGE PASSWORD</button>
        <div class="account">
          <p>
            Don't have an account yet? <a href="signup.jsp" class="signup">Sign up</a>
          </p>
        </div>
      </form>
    </div>
  </body>
</html>