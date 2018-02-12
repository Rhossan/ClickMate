<%-- 
    Document   : logIn
    Created on : Dec 2, 2016, 2:20:05 PM
    Author     : HTC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<%
	// Get session creation time.
	if ((session.getAttribute("accountID") == null) || (session.getAttribute("accountID") == "")) {
		
	}
	else{
		request.getRequestDispatcher("homep.jsp").forward(request, response);
	}
%>
    <head>
        <meta charset="UTF-8">
        <title>Sign-Up/Login Form</title>
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="form">
            <ul class="tab-group">
                <li class="tab active"><a href="#signup">Sign Up</a></li>
                <li class="tab"><a href="#login">Log In</a></li>
            </ul>

            <div class="tab-content">
                <div id="signup">   
                    <h1>Sign Up for Free</h1>

                    <form action="registerUser.jsp" method="post">

                        <div class="top-row">
                            <div class="field-wrap">
                                <label>
                                    First Name<span class="req">*</span>
                                </label>
                                <input type="text" name = "first name" required autocomplete="off" />
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Last Name<span class="req">*</span>
                                </label>
                                <input type="text" name = "last name" required autocomplete="off"/>
                            </div>
                        </div>

                        <div class="field-wrap">
                            <label>
                                Email Address<span class="req">*</span>
                            </label>
                            <input type="email" name="email address"required autocomplete="off"/>
                        </div>

                        <div class="field-wrap">
                            <label>
                                Set A Password<span class="req">*</span>
                            </label>
                            <input type="password" name = "new password" required autocomplete="off"/>
                        </div>
						<div class="field-wrap">
                            <label>
                                Address<span class="req">*</span>
                            </label>
                            <input type="text" name = "address" required autocomplete="off"/>
                        </div>
						<div class="field-wrap">
                            <label>
                                City<span class="req">*</span>
                            </label>
                            <input type="text" name = "city" required autocomplete="off"/>
                        </div>
						<div class="field-wrap">
                            <label>
                                State<span class="req"></span>
                            </label>
                            <input type="text" name = "state" required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Zip Code<span class="req"></span>
                            </label>
                            <input type="text" name = "zip code" required autocomplete="off"/>
                        </div>
						<div class="field-wrap">
                            <label>
                                Phone Number<span class="req">*</span>
                            </label>
                            <input type="text" name = "phone" required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Date Of Birth (year-month-day)<span class="req">*</span>
                            </label>
                            <input type="text" name = "dob" required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Gender (M/F)<span class="req">*</span>
                            </label>
                            <input type="text" name = "gender" required autocomplete="off"/>
                        </div>
                        <div class="field-wrap">
                            <label>
                                Credit Card #<span class="req">*</span>
                            </label>
                            <input type="text" name = "creditcard" required autocomplete="off"/>
                        </div>
                        <button type="submit" class="button button-block"/>Get Started</button>

                    </form>

                </div>

                <div id="login">   
                    <h1>Welcome Back!</h1>

                    <!--<form action="/ClickMate/logInServlet" method="post"> -->
        			<form method="post" action="loginAccount.jsp">

                        <div class="field-wrap">
                            <label>
                                Email Address<span class="req">*</span>
                            </label>
                            <input type="email" name = "email" required autocomplete="off"/>
                        </div>

                        <div class="field-wrap">
                            <label>
                                Password<span class="req">*</span>
                            </label>
                            <input type="password" name = "password" required autocomplete="off"/>
                        </div>
                        <button class="button button-block"/>Log In</button>
				        </form>
						

                </div>

            </div><!-- tab-content -->

        </div> <!-- /form -->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/login.js"></script>

    </body>
</html>
