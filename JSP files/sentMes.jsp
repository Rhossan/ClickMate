<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <!-- Search Navbar - START -->
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
                        <li ><a href="#">Home</a></li>
                        <li class="active"><a href="messages.jsp">Message</a></li>
                        <li class="dropdown">
                            <a href="group.jsp" class="dropdown-toggle" data-toggle="dropdown">Group<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">code1</a></li>
                                <li><a href="#">code2</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Setting</a></li>
                    </ul>
                    <div class="col-sm-3 col-md-3 pull-right">
                        <form class="navbar-form" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search user or group" name="q">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>        
                </div>
            </nav>
            <div class="row content">
                <div class="col-sm-2 sidenav">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="compose.jsp">Compose</a></li>
                        <li ><a href="messages.jsp">Inbox</a></li>
                        <li class="active"><a href="#">Sent Messages</a></li>
                    </ul>
                </div>
                <div class="col-sm-8 text-left"> 
                    <form class ="getMes" action='/'>
                        <label hidden = true>to put the message id</label>
                        <h5><span class="glyphicon glyphicon-time"></span> send to John Doe, Sep 24, 2015.</h5>
                        <p>what's up!</p>
                        <button type="submit">Delete</button>
                           
                    </form>
                    <hr>
                </div>
            </div>
        </div>
    </body>
</html>
