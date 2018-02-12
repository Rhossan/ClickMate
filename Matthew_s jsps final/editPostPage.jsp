<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Edit Post</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<script>
	function changeLike(a) {
		if (a.getAttribute("src") == 'like.png') {
			a.src = "dislike.png";

		} else
			a.src = "like.png";
	}
	/*function makePost(){
		var t = document.getElementById('newPost');
		var url = '/Click/makePost?newPost'+t.value;
		req = new XMLHttpRequest();
		req.open("GET", url, true);
		req.onreadystatechange = companyValidation;
		req.send(null);
		//document.getElementById('test').innerHTML = '<p>hello!!!</p>';
		
	}*/
	/*function companyValidation() {
		if (req.readyState == 4 && req.status == 200) {
		if (req.responseText != "ok") {
			f.innerHTML = req.responseText;
	}*/
</script>
<%
String id=request.getParameter("postID");
System.out.println(id);
%>
</head>
<body>
	<sql:query var="rs" dataSource="jdbc/localhost">
		select * from userdata U, accounts A where U.UserID=A.UserID and A.AccountNumber=<%=session.getAttribute("accountID")%>;
	</sql:query>

	<sql:query var="postdata" dataSource="jdbc/localhost">
		select * from postdata where OwnerID=<%=session.getAttribute("accountID")%> and PageID=<%=session.getAttribute("pageid")%> order by DateTimeCreated desc;
	</sql:query>
	<sql:query var="groups" dataSource="jdbc/localhost">
SELECT * FROM GroupData GD, GroupMembers GM WHERE (GD.OwnerID = <%=session.getAttribute("accountID")%> OR GM.AccountNumber = <%=session.getAttribute("accountID")%>) AND GD.GroupID = GM.GroupID group by GroupName;
	</sql:query>
	<div class="container">
		<!-- Search Navbar - START -->
		<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="homep.jsp">${rs.rows[0].FirstName}
					${rs.rows[0].LastName}</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="homep.jsp">Home</a></li>
					<li><a href="messages.jsp"> sxxxs ${postdata.rows[0].PostID}</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Group<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="createGroupPage.jsp">Create Group</a></li>
								<c:forEach var="row" items="${groups.rows}">
									<li><a href="group.jsp?groupID=${row.GroupID }">${row.GroupName}</a></li>
								</c:forEach>
						</ul></li>
						<li class="active"><a href="logout.jsp">Log out</a></li>

				</ul>
				<div class="col-sm-3 col-md-3 pull-right">
					<form class="navbar-form" role="search">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search user or group" name="q">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</nav>
		
		<div class="container-fluid text-center">
			<div class="row content">
				<div class="col-sm-8 text-left">
					<div class="top-row">
					
					     <form action="editPost.jsp?postID=<%=id %>" method="post">
                            <div class="field-wrap">
                                <label>
                                    Edit Post<span class="req">*</span>
                                </label>
                                <textarea name="editPost" id="editPost" class="form-control"
								rows="3" required>${postdata.rows[0].Content}</textarea>
                            </div>

						<button type="submit" class="button button-block"/>Edit Post</button>

                    </form>
				</div>

				
			</div>
		</div>
	</div>
</body>
</html>