<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.option {
	text-align: center;
}
</style>
</head>
<body>


<nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">UserName or login</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="messages.jsp">Message</a></li>
                        <li><a href="#">Settings</a></li>
                    </ul>
                     <ul class ="nav navbar-nav navbar-right">
                     <li><a href="#">Log Out</a></li>
                     <li><a href= "#">Contact</a><li>
                     
                     </ul>     
                </div>
            </nav>
            <div class="container my-panel">
            <h1>Manager's Page</h1>
            	<div class="row">
            		<div class="col-md-6 col-sm-6 col-xs-12 option">
            			<button onclick="toggle_div( 'add_edit_delete' )" type="button" class=" btn btn-success">Add, Edit, Delete</button>
            			<div id="add_edit_delete" class="result">
            			<p>Put table results here</p>
            			</div>
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
            			<button onclick="toggle_div( 'rep_revenue' )" type="button" class=" btn btn-success">Get Representative Revenue</button>
            			<div id="rep_revenue" class="result">
            			<p>Put table results here</p>
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