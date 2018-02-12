<%@ page import ="java.sql.*" %>
<%
String email = request.getParameter("email address");
String first = request.getParameter("first name");
String last = request.getParameter("last name");
String password = request.getParameter("new password");
String zipcode = request.getParameter("zip code");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String creditcard = request.getParameter("creditcard");
String phone = request.getParameter("phone");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    Statement st = con.createStatement();
    ResultSet rs;
    String sql = "SELECT EmailAddress FROM userdata WHERE "+
   		 "EmailAddress = '"+ email+"'";
    rs = st.executeQuery(sql);
    if (rs.next()) {
    		out.println("Invalid email used");
            response.sendRedirect("login.jsp");
        //session.setAttribute("accountID", rs.getInt("AccountNumber")+"");
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
    }
    else{
    	//is valid email
    	//get new userid
    	ResultSet rs1;
        Statement st1 = con.createStatement();
	    sql = "select max(userid) as total from userdata;";
	   	rs1 = st1.executeQuery(sql);
	   	int userID=0;
	   	if (rs1.next()) {
	   	  userID = rs1.getInt(1) + 1;
   		}
		int accountID = userID + 800000;
		ResultSet rs2;
        Statement st2 = con.createStatement();

	    sql = "select max(pageid) as total from pagedata;";
	   	rs2 = st2.executeQuery(sql);
	   	int pageID=0;
	   	if (rs2.next()) {
	   	  pageID = rs2.getInt(1) + 1;
   		}
        Statement st3 = con.createStatement();

	   	sql = "INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Gender, DOB, Preferences, Phone)" +
	    		"VALUES('" + userID +"', '"+password+"', NULL, '"+zipcode+"', '"+last+"', '"+first+
	    				"', '"+address+"', '"+city+"', '"+state+"', '"+creditcard+"','"+ email +"','2016-12-01', '"+gender+"', '"+dob+
	    				"','NULL','"+phone+"');";
	   	st3.executeUpdate(sql);
	   	
        Statement st4 = con.createStatement();

	    sql = "insert into Accounts(AccountNumber, UserID)"+
	    		"values('"+accountID+"', '"+userID+"');";
	    st4.executeUpdate(sql);	   	
	   	
        Statement st5 = con.createStatement();

	    sql = "INSERT INTO PageData(PageID, PostCount, OwnerID)"+
	    		"VALUES ('"+pageID+"', 0, '"+accountID+"');";
	   	st5.executeUpdate(sql);	   	
	   	
    	session.setAttribute("accountID", accountID);
    	session.setAttribute("pageID", pageID);
    	response.sendRedirect("homep.jsp");
    }
%>