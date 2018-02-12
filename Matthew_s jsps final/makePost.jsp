<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date;" %>
<%
	String postContent = request.getParameter("newPost");
	System.out.println(postContent);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String id = (String)session.getAttribute("accountID");
    String grid = (String)session.getAttribute("groupID");
    int pageid=(Integer)session.getAttribute("pageid");

    if(grid!=null){
    	Statement st2 = con.createStatement();
    	ResultSet rs1;
    	String sql = "SELECT PageID FROM GroupPage WHERE GroupID ='"+grid+"'";
    	rs1 = st2.executeQuery(sql);
    	if(rs1.next()){
    		pageid = rs1.getInt(1);
    	}
   	    }
    String sql = "select max(PostID) as total from postdata; ";
   	rs = st.executeQuery(sql);
   	int total=0;
   	if (rs.next()) {
   	  total = rs.getInt(1);
   	}
    total++;
    out.println(total);
    Statement st1=con.createStatement();;
    String sql1 = "INSERT INTO postdata VALUES ("+total+ ","+ pageid +","+ id +", '"+ new java.sql.Timestamp(new java.util.Date().getTime())+"', 0, '"+ postContent+"');";
    System.out.println(sql1);
    if(st1.executeUpdate(sql1)==1){
    	if(grid==null)
	        response.sendRedirect("homep.jsp");
    	else
	        response.sendRedirect("group.jsp");    		
    }
%>