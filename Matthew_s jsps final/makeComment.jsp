<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date;" %>
<%
	String a = request.getParameter("author");
	String id = request.getParameter("postID");
	String commentContent = request.getParameter("newComment");
	System.out.println(a +" "+id+ " "+ commentContent);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String sql = "select max(CommentID) as total from CommentsData; ";
   	rs = st.executeQuery(sql);
   	int commentID =0;
   	if (rs.next()) {
   	  commentID = rs.getInt(1)+1;
   	}
   	Statement st1 = con.createStatement();
   	sql = "INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author) "+
   	"VALUES ('"+commentID+"', '"+new java.sql.Timestamp(new java.util.Date().getTime())+"', 0, '"+commentContent+"', '"+a+"')";
	System.out.println(sql);
   	st1.executeUpdate(sql);
	
	Statement st2 = con.createStatement();
	sql = "INSERT INTO CommentPost (CommentID, PostID) "+
   	"VALUES ('"+commentID+"','"+id+"')";
	System.out.println(sql);
   	st2.executeUpdate(sql);
	
	Statement st3 = con.createStatement();
	sql = "UPDATE PostData SET CommentCount = CommentCount WHERE PostID = '"+id+"'";
	st3.executeUpdate(sql);
	response.sendRedirect("homep.jsp");
    
%>