<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Home Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <script>
            function changeLike(a) {
                if (a.getAttribute("src") == 'like.png') {
                    a.src = "dislike.png";
                }
                else
                    a.src = "like.png";
            }
        </script>
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
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="messages.jsp">Message</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Group<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="group.jsp">code1</a></li>
                                <li><a href="group.jsp">code2</a></li>
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
            <div class="container-fluid text-center">    
                <div class="row content">
                    <div class="col-sm-8 text-left"> 
                        <h4>Post:</h4>
                        <form role="form" action='/' >
                            <div class="form-group">
                                <textarea id="newPost" class="form-control" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-success" >Submit</button>
                        </form>
                        <hr>
                        <h4>Recent Posts:</h4>  
                        <div class="RecentPosts">
                            <div class="prePost">
                                <p>this area is for recent post</p>
                                <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
                                <span><input type="image" src="like.png" onclick ="changeLike(this)"/>+10</span>
                                <h4>Leave a Comment:</h4>
                                <form role="form">
                                    <div class="form-group">
                                        <textarea class="form-control" rows="3" required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </form>
                                <hr>
                                <div class="commentData">
                                    <p><span class="badge">2</span> Comments:</p><br>
                                    <p>wow!!!</p>
                                    <h5><span class="glyphicon glyphicon-time"></span> Post by John Doe, Sep 24, 2015.</h5>
                                    <span><input type="image" src="like.png" onclick ="changeLike(this)"/>+10</span>
                                </div>
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