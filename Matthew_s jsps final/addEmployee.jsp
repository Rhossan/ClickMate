<%@ page import ="java.sql.*" %>
<%
	System.out.println("add");
	//String id=request.getParameter("employeeID");
	String fname=request.getParameter("first");
	String lname=request.getParameter("last");
	String addr=request.getParameter("address");
	String ci=request.getParameter("city");
	String st=request.getParameter("state");
	String zip=request.getParameter("zipcode");
	String rate=request.getParameter("hourlyrate");
	String pnum=request.getParameter("phone");
	String lvl=request.getParameter("level");
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys",
            "root", "matth3w94wkawa");
    
    ResultSet rs;
   	Statement st1 = con.createStatement();
    String sql = "select max(EmployeeID) as total from EmployeeData; ";
   	rs = st1.executeQuery(sql);
   	int id=0;
   	if (rs.next()) {
   	  id = rs.getInt(1);
   	}
    
 
   	Statement st6 = con.createStatement();
   	
   	sql ="INSERT INTO EmployeeData(ZipCode, State, City, Address, LastName, FirstName, Telephone, HourlyRate, AuthenicationLevel, Username, Password, EmployeeID) "+
   	"VALUES('"+zip+"','"+st+"','"+ci+"','"+addr+"','"+lname+"','"+fname+"','"+pnum+"','"+rate+"','"+lvl+"','"+user+"','"+pass+"','"+id+")";
   	
   	System.out.println(sql);
   	st6.executeUpdate(sql);
   	//Statement st3 = con.createStatement();
   	//sql = "DELETE FROM PageData WHERE PageID = '"+pageID+"';";
   	//st3.executeUpdate(sql);
    response.sendRedirect("Add_Delete_Edit.jsp");
%>