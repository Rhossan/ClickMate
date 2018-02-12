<%@ page import ="java.sql.*" %>
<%



	String id=request.getParameter("employeeID");
	String fname=request.getParameter("first");
	String lname=request.getParameter("last");
	String addr=request.getParameter("address");
	String ci=request.getParameter("city");
	String st=request.getParameter("state");
	String zip=request.getParameter("zipcode");
	String rate=request.getParameter("hourlyrate");
	String pnum=request.getParameter("phone");
	String lvl=request.getParameter("level");
	
	System.out.println(id + " " + fname + " " + lname + " " + addr + " " + ci + " " + st + " " + zip + " " + rate + " " + pnum + " "  + lvl);
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
   	Statement st6 = con.createStatement();
   	
   	String sql ="UPDATE EmployeeData SET FirstName = '"+fname+"', LastName = '"+lname+"' , Address = '"+addr+"' , "+
   	"City = '"+ci+"', State = '"+st+"' , ZipCode = '"+zip+"' , HourlyRate = '"+rate+"' , Telephone = '"+pnum+"' , "+
   	"AuthenicationLevel = '"+lvl+"' where EmployeeID = '"+id+"'";
   	System.out.println(sql);
   	st6.executeUpdate(sql);
   	//Statement st3 = con.createStatement();
   	//sql = "DELETE FROM PageData WHERE PageID = '"+pageID+"';";
   	//st3.executeUpdate(sql);
    response.sendRedirect("Add_Delete_Edit.jsp");
%>