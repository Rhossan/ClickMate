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

<title>Manager Page</title>
<style type="text/css">
.my-panel {
  padding: 40px 40px 200px;
  background: rgba(19, 35, 47, 0.9);
  border-radius: 4px;
	box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
	margin-right: auto;
	margin-left: auto;
	width: 75%;
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
	width: 200px !important;
	margin-bottom: 20px !important;
}
.my-table{
	color: #fff;
}
.option {
	text-align: center;
}
</style>
</head>
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
<sql:query var="rs" dataSource="jdbc/localhost">
SELECT A.EmployeeID, E.FirstName, E.LastName, SUM(S.NumberOfUnits*A.UnitPrice) as total FROM SalesData S, AdvertisementData A, EmployeeData E where S.AdvertisementID = A.AdvertisementID AND E.EmployeeID = A.EmployeeID GROUP BY A.EmployeeID ORDER BY SUM(A.UnitPrice) desc;
						</sql:query>
<sql:query var="rs1" dataSource="jdbc/localhost">						
SELECT U.FirstName, U.LastName,SUM(S.NumberOfUnits*A.UnitPrice) as total FROM SalesData S, Accounts AC, AdvertisementData A, UserData U where S.AdvertisementID = A.AdvertisementID AND AC.AccountNumber = S.AccountNumber AND U.UserID = AC.UserID GROUP BY FirstName, LastName order by total desc;
						</sql:query>
<sql:query var="rs2" dataSource="jdbc/localhost">						
SELECT A.AdvertisementType, A.Company, A.Content, A.ItemName, A.UnitPrice, S.NumberOfUnits FROM SalesData S, Advertisementdata A where S.AdvertisementID = A.AdvertisementID group by A.AdvertisementID order by S.NumberOfUnits desc limit 3;						
</sql:query>
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
                     <li>
                     	<a href="logout.jsp">Log Out</a>
                     </li>
                     
                     </ul>     
                </div>
            </nav>
            <div class="container my-panel">
            <h1>Manager's Page</h1>
            	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<a href="Add_Delete_Edit.jsp">
            			<button type="button" class=" btn btn-success">Add, Edit, Delete</button>
            			</a>
            		</div>
            		<div class="col-md-6 col-md-6 col-xs-12 option">
            			<button onclick="toggle_div( 'produce_listing' )" type="button" class=" btn btn-success">Produce listing</button>
            			<div id="produce_listing" class="result">
            			<p>Put table results here</p>
            			</div>
            		</div>
            	</div><!--  /.row -->
            	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<button onclick="toggle_div( 'sales_report' )" type="button" class=" btn btn-success">Sales Report</button>
            			<div id="sales_report" class="result">
            			<p>Put table results here</p>
            			</div>
            		</div>
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<button onclick="toggle_div( 'produce_transactions' )" type="button" class=" btn btn-success">Produce Transactions</button>
            			<div id="produce_transactions" class="result">
            			<p>Put table results here</p>
            			</div>
            		</div>
            	</div><!-- /.row -->
            	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<button onclick="toggle_div( 'summary' )" type="button" class=" btn btn-success">Summary</button>
            			<div id="summary" class="result">
            			<p>Put table results here</p>
            			</div>
            		</div>
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<button onclick="toggle_div( 'revenue' )" type="button" class=" btn btn-success">Revenue Ranking</button>
            			<div id="revenue" class="result">
            					<p>
		            			The Customer Representative that generated the most total revenue is: ${rs.rows[0].FirstName}
								${rs.rows[0].LastName}
								</p>
								<p>
		            			 This person generated: $${rs.rows[0].total}
		            			 </p>
		            			 
		        				<p>
		        				The customer that generated the most revenue is: ${rs1.rows[0].FirstName} ${rs1.rows[0].LastName}
		        				</p>
		        				<p>
		        				This person generated: $${rs1.rows[0].total }
		        				</p>
            			</div>
            		</div>
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<button onclick="toggle_div( 'most_active_items' )" type="button" class=" btn btn-success">Most Active Items</button>
            			<div id="most_active_items" class="result">
            			<p>
            					<table border="1" width="100%">
								<tr>
									<th>Item Type</th>
									<th>Company</th>
									<th>Content</th>
									<th>Item Name</th>
									<th>Unit Price</th>
									<th>Number of Units Sold</th>
																	
								</tr>
								<c:forEach var="row" items="${rs2.rows}">
									<tr>
										<td><c:out value="${row.AdvertisementType}" /></td>
										<td><c:out value="${row.Company}" /></td>
										<td><c:out value="${row.Content}" /></td>
										<td><c:out value="${row.ItemName}" /></td>
										<td><c:out value="${row.UnitPrice}" /></td>
										<td><c:out value="${row.NumberOfUnits}" /></td>
									</tr>
								</c:forEach>
							</table>
							</p>
            			</div>
            		</div>
            	</div><!-- /.row -->
            </div><!--  /.container -->
            <script type="application/javascript">
            	function toggle_div( id ) {
            		var el = document.getElementById( id );
            		
            		if( el.style.display == "none" )
            			el.style.display = "block";
            		else
            			el.style.display = "none";
            	}
            </script>
</body>
</html>