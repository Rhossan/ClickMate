package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\" />\n");
      out.write("        <title>Home Page</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"bootstrap/css/bootstrap.min.css\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-1.10.2.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            function changeLike(a) {\n");
      out.write("                if (a.getAttribute(\"src\") == 'like.png') {\n");
      out.write("                    a.src = \"dislike.png\";\n");
      out.write("                }\n");
      out.write("                else\n");
      out.write("                    a.src = \"like.png\";\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <!-- Search Navbar - START -->\n");
      out.write("            <nav class=\"navbar navbar-default\" role=\"navigation\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">UserName or login</a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\n");
      out.write("                    <ul class=\"nav navbar-nav\">\n");
      out.write("                        <li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("                        <li><a href=\"#\">Message</a></li>\n");
      out.write("                        <li class=\"dropdown\">\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Group<b class=\"caret\"></b></a>\n");
      out.write("                            <ul class=\"dropdown-menu\">\n");
      out.write("                                <li><a href=\"#\">code1</a></li>\n");
      out.write("                                <li><a href=\"#\">code2</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li><a href=\"#\">Setting</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <div class=\"col-sm-3 col-md-3 pull-right\">\n");
      out.write("                        <form class=\"navbar-form\" role=\"search\">\n");
      out.write("                            <div class=\"input-group\">\n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"Search\" name=\"q\">\n");
      out.write("                                <div class=\"input-group-btn\">\n");
      out.write("                                    <button class=\"btn btn-default\" type=\"submit\"><i class=\"glyphicon glyphicon-search\"></i></button>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>        \n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("            <div class=\"container-fluid text-center\">    \n");
      out.write("                <div class=\"row content\">\n");
      out.write("                    <div class=\"col-sm-8 text-left\"> \n");
      out.write("                        <h4>Post:</h4>\n");
      out.write("                        <form role=\"form\" action='/' >\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <textarea id=\"newPost\" class=\"form-control\" rows=\"3\" required></textarea>\n");
      out.write("                            </div>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-success\" >Submit</button>\n");
      out.write("                        </form>\n");
      out.write("                        <hr>\n");
      out.write("                        <h4>Recent Posts:</h4>  \n");
      out.write("                        <div class=\"RecentPosts\">\n");
      out.write("                            <div class=\"prePost\">\n");
      out.write("                                <p>this area is for recent post</p>\n");
      out.write("                                <h5><span class=\"glyphicon glyphicon-time\"></span> Post by John Doe, Sep 24, 2015.</h5>\n");
      out.write("                                <span><input type=\"image\" src=\"like.png\" onclick =\"changeLike(this)\"/>+10</span>\n");
      out.write("                                <h4>Leave a Comment:</h4>\n");
      out.write("                                <form role=\"form\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <textarea class=\"form-control\" rows=\"3\" required></textarea>\n");
      out.write("                                    </div>\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-success\">Submit</button>\n");
      out.write("                                </form>\n");
      out.write("                                <hr>\n");
      out.write("                                <div class=\"commentData\">\n");
      out.write("                                    <p><span class=\"badge\">2</span> Comments:</p><br>\n");
      out.write("                                    <p>wow!!!</p>\n");
      out.write("                                    <h5><span class=\"glyphicon glyphicon-time\"></span> Post by John Doe, Sep 24, 2015.</h5>\n");
      out.write("                                    <span><input type=\"image\" src=\"like.png\" onclick =\"changeLike(this)\"/>+10</span>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-2 sidenav\">\n");
      out.write("                        <div class=\"well\">\n");
      out.write("                            <p>ADS</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"well\">\n");
      out.write("                            <p>ADS</p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
