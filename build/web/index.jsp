<%-- 
    Document   : index
    Created on : Apr 29, 2023, 3:08:33 PM
    Author     : Dwight Kenneth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="index.css">
    <title>MyCICS Student Portal</title> <!--TODO-->
</head>

<body>
  
    <!-- Header -->
    <section id="header">
        <div class="header container">
        <div class="nav-bar">
            <div class="brand">
            <a href="#hero">
                <h1>My<span>CICS</span> <span>S</span>tudent <span>P</span>ortal</h1> <!--TODO-->
            </a>
            </div>
            <div class="nav-list">
            <div class="hamburger">
                <div class="bar"></div>
            </div>
            <ul> <!--TODO-->
                <li><a href="#hero" data-after="Home">Home</a></li>
                <li><a href="#about" data-after="About">About</a></li>
                <li><a href="#mv" data-after="Mission & Vision">Mission & Vision</a></li>
                <li><a href="#programs" data-after="Programs">Programs</a></li> <!--TODO NEXT-->
                <li><a href="#contact" data-after="Contact">Contact</a></li>
            </ul>
            </div>
        </div>
        </div>
    </section>
    <!-- End Header -->

    <!-- Hero Section  --> <!--TODO-->
    <section id="hero">
        <div class="hero container">
        <div>
            <h1>A New <span></span></h1>
            <h1>Approach to <span></span></h1>
            <h1>College Education <span></span></h1>
            <a href="login.jsp" type="button" class="cta">Learn More</a> <!--TODO: link to login page-->
        </div>
        </div>
    </section>
    <!-- End Hero Section  -->

    <!-- About Section -->
    <section id="about">
        <div class="about container">
            <div class="col-left">
                <div class="about-img">
                    <img src="./img/laptop-user.jpg" alt="img">
                </div>
            </div>
            <div class="col-right">
                <h1 class="section-title"><span>About</span></h1>
                <h2>An Online College Management System</h2>
                <p>The CICS Student Profile System is a web-based application allowing the College of Information and Computing Sciences (CICS) to collect and manage student data. The system provides a comprehensive view of each student’s academic journey, including personal information, academic performance, attendance, behavior, and other relevant data.</p>
                <a href="#" class="cta">Learn More</a>
            </div>
        </div>
    </section>
    <!-- End About Section -->
    
    <!-- Mission & Vision Section -->
    <section id="mv">
        <div class="mv container">
            <!--<div class="mv-top">
                <h1 class="section-title"><span>Mission & Vision</span></h1>
            </div>-->
            <div class="mv-bottom">
                <div class="mv-item">
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <path d="M448 256A192 192 0 1 0 64 256a192 192 0 1 0 384 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm256 80a80 80 0 1 0 0-160 80 80 0 1 0 0 160zm0-224a144 144 0 1 1 0 288 144 144 0 1 1 0-288zM224 256a32 32 0 1 1 64 0 32 32 0 1 1 -64 0z"/>
                        </svg>
                    </div>
                    <h2>Mission</h2>
                    <p>The Institute of Information and Computing Sciences of the University of Santo Tomas, under the inspiration of its model, Saint Thomas Aquinas, and its patron, Saint Vincent Ferrer, declares its commitment to the pursuit of truth and the formation of technically competent ITE professionals endowed with a strong commitment to lifelong learning, social responsibility and a desire for leadership in the spirit of service in their respective fields of specialization.</p>
                </div>
                <div class="mv-item">
                    <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                            <path d="M288 80c-65.2 0-118.8 29.6-159.9 67.7C89.6 183.5 63 226 49.4 256c13.6 30 40.2 72.5 78.6 108.3C169.2 402.4 222.8 432 288 432s118.8-29.6 159.9-67.7C486.4 328.5 513 286 526.6 256c-13.6-30-40.2-72.5-78.6-108.3C406.8 109.6 353.2 80 288 80zM95.4 112.6C142.5 68.8 207.2 32 288 32s145.5 36.8 192.6 80.6c46.8 43.5 78.1 95.4 93 131.1c3.3 7.9 3.3 16.7 0 24.6c-14.9 35.7-46.2 87.7-93 131.1C433.5 443.2 368.8 480 288 480s-145.5-36.8-192.6-80.6C48.6 356 17.3 304 2.5 268.3c-3.3-7.9-3.3-16.7 0-24.6C17.3 208 48.6 156 95.4 112.6zM288 336c44.2 0 80-35.8 80-80s-35.8-80-80-80c-.7 0-1.3 0-2 0c1.3 5.1 2 10.5 2 16c0 35.3-28.7 64-64 64c-5.5 0-10.9-.7-16-2c0 .7 0 1.3 0 2c0 44.2 35.8 80 80 80zm0-208a128 128 0 1 1 0 256 128 128 0 1 1 0-256z"/>
                        </svg>
                    </div>
                    <h2>Vision</h2>
                    <p>The Institute of Information and Computing Sciences envisions itself as a premier and innovative institution in Information Technology Education and research in the Asia-Pacific Region.</p>
                </div>
            </div>
        </div>
    </section>
    <!-- End Mission & Vision Section -->

    <!-- Programs Section -->
    <section id="programs">
        <div class="programs container">
            <div class="programs-header">
                <h1 class="section-title">Degree <span>Programs</span></h1>
            </div>
            <div class="all-programs">
                <div class="programs-item">
                    <div class="programs-info">
                        <h1>Computer Science</h1>
                        <h2>Bachelor of Science</h2>
                        <p><br>
                            Bachelor of Science in Computer Science (BS CS) is a four-year program that includes the study of computing 
                            concepts and theories, algorithmic foundations, and new developments in computing. The program prepares its students 
                            to design and create algorithmically complex software and develop new and effective algorithms for solving computing problems.
                        </p>
                    </div>
                    <div class="programs-img">
                        <img src="./img/comsci.jpg" alt="img">
                    </div>
                </div>
                <div class="programs-item">
                    <div class="programs-info">
                        <h1>Information Systems</h1>
                        <h2>Bachelor of Science</h2>
                        <p><br>
                            Bachelor of Science in Information Technology (BS IT) is a four-year degree program that equips students with the basic ability 
                            to conceptualize, design and implement software applications. It prepares students to be IT professionals who are able to perform installation, 
                            operation, development, maintenance, and administration of computer applications. The goal of the program is to produce information 
                            technologists who can assist individuals and organizations in solving problems using information technology techniques and processes. 
                        </p>
                    </div>
                    <div class="programs-img">
                        <img src="./img/infosys.jpg" alt="img">
                    </div>
                </div>
                <div class="programs-item">
                    <div class="programs-info">
                        <h1>Information Technology</h1>
                        <h2>Bachelor of Science</h2>
                        <p><br>
                            Bachelor of Science in Information System (BS IS), is a four year degree program that deals with the design and implementation of solutions 
                            that integrate information technology with business processes. The program teaches students 
                            all about hardware and software applications and how they can use them to collect, filter, process, create and distribute data.
                        </p>
                    </div>
                    <div class="programs-img">
                        <img src="./img/infotech.jpg" alt="img">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Programs Section -->

    <!-- Contact Section -->
    <section id="contact">
        <div class="contact container">
        <div>
            <h1 class="section-title"><span>Contact</span> Us</h1>
        </div>
        <div class="contact-items">
            <div class="contact-item">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/>
                </svg>
            </div>
            <div class="contact-info">
                <h1>Phone</h1>
                <h2>+63 123 456 7890</h2>
                <h2>+63 123 456 7890</h2>
            </div>
            </div>
            <div class="contact-item">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/>
                </svg>
            </div>
            <div class="contact-info">
                <h1>Email</h1>
                <h2>sample@ust.edu.ph</h2>
                <h2>sample@ust.edu.ph</h2>
            </div>
            </div>
            <div class="contact-item">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                    <path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/>
                </svg>
            </div>
            <div class="contact-info">
                <h1>Address</h1>
                <h2>España Blvd., Sampaloc, Manila, Philippines</h2>
            </div>
            </div>
        </div>
        </div>
    </section>
    <!-- End Contact Section -->

    <!-- Footer -->
    <section id="footer">
        <div class="footer container">
        <div class="brand">
            <h1>My<span>CICS</span> <span>S</span>tudent <span>P</span>ortal</h1>
        </div>
        <h2>An Online College Management System</h2>
        <div class="social-icon">
            <div class="social-item">
            <a href="#">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                    <path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"/>
                </svg>
            </a>
            </div>
            <div class="social-item">
            <a href="#">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="M128 32C92.7 32 64 60.7 64 96V352h64V96H512V352h64V96c0-35.3-28.7-64-64-64H128zM19.2 384C8.6 384 0 392.6 0 403.2C0 445.6 34.4 480 76.8 480H563.2c42.4 0 76.8-34.4 76.8-76.8c0-10.6-8.6-19.2-19.2-19.2H19.2z"/>
                </svg>
            </a>
            </div>
            <div class="social-item">
            <a href="#">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                    <path d="M392.8 1.2c-17-4.9-34.7 5-39.6 22l-128 448c-4.9 17 5 34.7 22 39.6s34.7-5 39.6-22l128-448c4.9-17-5-34.7-22-39.6zm80.6 120.1c-12.5 12.5-12.5 32.8 0 45.3L562.7 256l-89.4 89.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l112-112c12.5-12.5 12.5-32.8 0-45.3l-112-112c-12.5-12.5-32.8-12.5-45.3 0zm-306.7 0c-12.5-12.5-32.8-12.5-45.3 0l-112 112c-12.5 12.5-12.5 32.8 0 45.3l112 112c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256l89.4-89.4c12.5-12.5 12.5-32.8 0-45.3z"/>
                </svg>
            </a>
            </div>
        </div>
        <p>Copyright © 2023 ICS2609 2CSC - Group 14. All rights reserved.</p>
        </div>
    </section>
    
    <!-- End Footer -->
    <script src="./index.js"></script>
</body>

</html>