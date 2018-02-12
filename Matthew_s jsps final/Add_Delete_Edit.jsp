<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
<title>Add/Delete/Edit Employee</title>
<style type="text/css">
.button_width{
	width: 50px !important;
}
.my-panel {
  padding: 40px 40px 200px;
  background: rgba(19, 35, 47, 0.9);
  border-radius: 4px;
	box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
	margin-right: auto;
	margin-left: auto;
	width: 95%;
	
}
.result {
	display: none;
	border: 1px solid #000;
	padding: 1em;
	margin-bottom: 20px !important;
}
.result p {
	color: #fff;
}
.my-panel button {
	width: 100px !important;
	margin-bottom: 20px !important;
}
.option {
	text-align: center;
}
</style>
</head>
<sql:query var="employees" dataSource="jdbc/localhost">
SELECT * FROM employeedata
	</sql:query>
<body>
<%
String name ="";
if(session.getAttribute("employeeid")!=null&&session.getAttribute("level").equals("M")){
	name = (String)session.getAttribute("name");
}
else{
    response.sendRedirect("employeeLogin.jsp");
}
%>

<nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Manage_page.jsp"><%=name %></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Manage_page.jsp">Home</a></li>
                    </ul>
                     <ul class ="nav navbar-nav navbar-right">
                     <li><a href="logout.jsp">Log Out</a></li>
                     
               
                     
                     </ul>     
                </div>
            </nav>
            
<div class="container my-panel">
<form class="form1">
    <div class="table-responsive">
    <c:forEach var="row" items="${employees.rows}">
					
        <table class="table table-bordered table-striped table-highlight">
            <thead>
                <th bgcolor="5E33ED"><font color="#fff">First Name</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Last Name</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Address</font></th>
				<th bgcolor="5E33ED"><font color="#fff">City</font></th>
				<th bgcolor="5E33ED"><font color="#fff">State</font></th>
				<th bgcolor="5E33ED"><font color="#fff">ZipCode</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Hourly Rate</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Telephone</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Authentication Level</font></th>
				<th bgcolor="5E33ED"><font color="#fff">SSN (ADD)</font></th>
				<th bgcolor="5E33ED"><font color="#fff">UserName (ADD)</font></th>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" class="form-control" value="${row.FirstName }"/></td>
                    <td><input type="text" class="form-control" value="${row.LastName }"/></td>
                    <td><input type="text" class="form-control" value="${row.Address }"/></td>
                    <td><input type="text" class="form-control" value="${row.City }"/></td>
                    <td><input type="text" class="form-control" value="${row.State }"/></td>
                    <td><input type="text" class="form-control" value="${row.ZipCode }"/></td>
                    <td><input type="text" class="form-control" value="${row.HourlyRate }"/></td>
                    <td><input type="text" class="form-control" value="${row.Telephone }"/></td>
                    <td><input type="text" class="form-control" value="${row.AuthenicationLevel }"/></td>
                     <td><input type="text" class="form-control" value=""/></td>
                     <td><input type="text" class="form-control" value=""/></td>
                    <td><a href="editEmployee.jsp?employeeID=${row.EmployeeID }&first=${row.FirstName}&last=${row.LastName}&address=${row.Address}&city=${row.City}&state=${row.State}&zipcode=${row.ZipCode}&hourlyrate=${row.HourlyRate}&phone=${row.Telephone}&level=${row.AuthenicationLevel}">
                    <button type="button" class="btn btn-info" >Edit</button></a></td>
                    <td><a href="deleteEmployee.jsp?employeeID=${row.EmployeeID }">
                    <button type="button" class="btn btn-danger" >Delete</button></a></td>
                    
                </tr>
                </tbody>
                </table>
                </c:forEach>

                <table class="table table-bordered table-striped table-highlight">

	            <thead>
                <th bgcolor="5E33ED"><font color="#fff">First Name</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Last Name</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Address</font></th>
				<th bgcolor="5E33ED"><font color="#fff">City</font></th>
				<th bgcolor="5E33ED"><font color="#fff">State</font></th>
				<th bgcolor="5E33ED"><font color="#fff">ZipCode</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Hourly Rate</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Telephone</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Authenticity</font></th>
				<th bgcolor="5E33ED"><font color="#fff">SSN (ADD)</font></th>
				<th bgcolor="5E33ED"><font color="#fff">UserName (ADD)</font></th>
				<th bgcolor="5E33ED"><font color="#fff">Password (ADD)</font></th>
				
            </thead>
            <tbody>
                <tr>
               		<td bgcolor="#fff"><input type="text" class="form-control" name="fname"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="lname"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="addr"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="ci"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="zipcode"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="rate"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="phone"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="level"/></td>
                    <td bgcolor="#fff"><input type="text" class="form-control" name="SSN"/></td>
                     <td bgcolor="#fff"><input type="text" class="form-control" name="employeeID"/></td>
                     <td bgcolor="#fff"><input type="text" class="form-control" name="username"/></td>
                      <td bgcolor="#fff"><input type="text" class="form-control" name="password"/></td>
                    <a href="addEmployee.jsp">
                    <td bgcolor="#fff"><button type="submit" class="btn btn-success btn-block" onclick="location.href='addEmployee.jsp';">Add</button></td>
                        </a>
                </tr>
            </tbody>
        </table>
        
    </div>
</form>






</div>
</body>
</html>