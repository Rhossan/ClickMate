<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<%String groupID = request.getParameter("groupID"); %>
<%session.setAttribute("groupID", groupID); %>
<sql:query var="group" dataSource="jdbc/localhost">
SELECT * FROM GroupData GD WHERE GD.GroupID = <%=groupID %>
</sql:query>

<title>${group.rows[0].GroupName}</title>
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
String pageid = (String)(session.getAttribute("pageid")+"");
%>
</head>
<body>
	<sql:query var="rs" dataSource="jdbc/localhost">
		select * from userdata U, accounts A where U.UserID=A.UserID and A.AccountNumber=<%=session.getAttribute("accountID")%>;
	</sql:query>

	<sql:query var="postdata" dataSource="jdbc/localhost">
select * from postdata pd, grouppage gp where gp.pageID = pd.pageID AND gp.groupID=<%=groupID %> order by pd.DateTimeCreated;
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
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Setting<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="renameGroupPage.jsp">Rename</a></li>
							<li><a href="deleteGroup.jsp?groupId=${groups.rows[0].GroupID }">Delete</a></li>
							<li><a href="leaveGroup.jsp?groupID=${groups.rows[0].GroupID }">Leave Group</a></li>
							<li><a href="AddMemeber.jsp?groupID=${groups.rows[0].GroupID }">Add Member</a></li>
							
						</ul></li>	
						
						<li><a href="logout.jsp">Log out</a></li>
						
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
					<h4>Post:</h4>
					<form role="form" action="makePost.jsp">
						<input type="hidden" name = "group" value = "${groups.rows[0].PageID }">
						<div class="form-group" >
							<textarea name="newPost" id="newPost" class="form-control"
								rows="3" required></textarea>
						</div>
						<button type="submit" class="btn btn-success">post</button>
					</form>

					<hr>
					<h4>Recent Posts:</h4>
					<div class="RecentPosts">
						<div id="prePost">
							<sql:query var="postdata" dataSource="jdbc/localhost">
								select * from postdata where OwnerID=<%=session.getAttribute("accountID")%> and PageID=${postdata.rows[0].pageID } order by DateTimeCreated desc;
							</sql:query>
							<c:forEach var="row" items="${postdata.rows}">
								<sql:query var="like" dataSource="jdbc/localhost">
									select count(*) as total from likepost where postID=${postdata.rows[0].pageID };
								</sql:query>

								<h5>
									<span class="glyphicon glyphicon-time"></span>Post by
									<c:out value="${rs.rows[0].FirstName}" />
									<c:out value=" ${rs.rows[0].LastName} " />
									,
									<c:out value="${row.DateTimeCreated}" />
									.
								</h5>
								<p>
									<c:out value="${row.Content}" />
								</p>
								<span><a href="likePost.jsp?postID=${postdata.rows[0].pageID }">   like   </a>
								<c:out value="${like.rows[0].total}" /><a href="editPostPage.jsp?postID=${postdata.rows[0].pageID }">   edit   </a> <a href="deletePost.jsp?postID=${postdata.rows[0].pageID }">delete</a></span>
								<h4>Leave a Comment:</h4>
								<form role="get" action="makeComment.jsp">
									<input type = 'hidden' name='author' value="<%= session.getAttribute("accountID") %>">
									<input type = 'hidden' name='postID' value="${postdata.rows[0].pageID }">
									
									<div class="form-group">
										<textarea id ="newComment" name="newComment" class="form-control" rows="3" required></textarea>
									</div>
									<button type="submit" class="btn btn-success">Submit</button>
								</form>
								<hr>
								<div class="commentData">
									<sql:query var="compo" dataSource="jdbc/localhost">
										select count(*) as total from commentpost where PostID=${postdata.rows[0].pageID };
									</sql:query>
									<sql:query var="com" dataSource="jdbc/localhost">
										select * from commentpost where PostID=${postdata.rows[0].pageID } order by CommentID desc;
									</sql:query>

									<p>
										<span class="badge">${compo.rows[0].total}</span> Comments:
									</p> 
									<br>
									<c:forEach var="row2" items="${com.rows}">

										<sql:query var="cd" dataSource="jdbc/localhost">
											select * from commentsdata where CommentID=${row2.CommentID};
										</sql:query>
										<h5>
											<sql:query var="ud" dataSource="jdbc/localhost">
												select * from userdata where userID=${cd.rows[0].Author};
											</sql:query>
											<span class="glyphicon glyphicon-time"></span>Post by

											<c:out value="${ud.rows[0].FirstName}" />
											<c:out value="${ud.rows[0].LastName} " />
											,
											<c:out value="${cd.rows[0].DateTimeCreated}" />
											.
										</h5>
										<p>
											<c:out value="${cd.rows[0].Content}" />
										</p>
										<p>
										
										</p>
										<br>
										<br>
									</c:forEach>
								</div>
							</c:forEach>





						</div>

					</div>
				</div>

				<div class="col-sm-2 sidenav">
					<div class="well">
						<p>ADS</p>
					</div>
					<div class="well">
						<p>ADS</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>