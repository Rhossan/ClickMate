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
		request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
                   <div id="login">   
                    <!--<form action="/ClickMate/logInServlet" method="post"> -->
        			<form method="post" action="loginEmployee.jsp">

                        <div class="field-wrap">
                            <label>
                                Username<span class="req">*</span>
                            </label>
                            <input type="email" name = "username" required autocomplete="off"/>
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


        </div> <!-- /form -->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/login.js"></script>

    </body>
</html>
