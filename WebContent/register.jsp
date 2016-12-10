<%-- 
    Document   : register
    Created on : Nov 15, 2016, 10:33:41 PM
    Author     : Ghost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <!--header-->
        <jsp:include page="header.jsp"/>
        <!--end of header-->
        <!-- grow -->
        <div class="grow">
            <div class="container">
                <h2>Register</h2>
            </div>
        </div>
        <!-- grow -->
        <!--content-->
        <div class=" container">
            <div class=" register">

                <form action="/COP/register" method="post">
                    <div class="col-md-6 register-top-grid">
                        <h3>Personal infomation</h3>
                        <div>
                            <span>First Name</span>
                            <input type="text" name="fName"> 
                        </div>
                        
                        <div>
                            <span>Last Name</span>
                            <input type="text" name="lName"> 
                        </div>
                        <div>
                            <span>Email Address</span>
                            <input type="text" name="email"> 
                        </div>
                   
                    </div>
                    <div class="col-md-6 register-bottom-grid">
                        <h3>Login information</h3>
                         <div>
                            <span>User Id</span>
                            <input type="text" name="UserId">
                        </div>
                        <div>
                            <span>Password</span>
                            <input type="password" name="pass">
                        </div>
                        <div>
                            <span>Confirm Password</span>
                            <input type="password" name="confirm">
                        </div>
                        <input type="submit" value="submit">

                    </div>
                    <div class="clearfix"> </div>
                </form>
            </div>
        </div>
        <!--//content-->
        <!--footer-->
        <jsp:include page="footer.jsp"/>
        <!--end of footer-->
    </body>
</html>
