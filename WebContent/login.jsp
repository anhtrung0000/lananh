<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <!--header-->
        <!--end of header-->
        <!--content-->
        <!-- grow -->
        <div class="grow">
            <div class="container">
                <h2>Login</h2>
            </div>
        </div>
        <!-- grow -->
        <!--content-->
        <div class="container">
            <div class="account">
                <div class="account-pass">
                    <div class="col-md-8 account-top">
                        <form action="/COP/Login_Servlet" method="post">

                            <div> 	
                                <span>UserName</span>
                                <input type="text" name="id"> 
                            </div>
                            <div> 
                                <span >Password</span>
                                <input type="password" name="password">
                            </div>				
                            <input type="submit" value="Login"> 
                        </form>
                    </div>
                    <div class="col-md-4 left-account ">
                        <a href="single.jsp"><img class="img-responsive " src="images/s1.jpg" alt=""></a>
                        <div class="five">
                            <h2>25% </h2><span>discount</span>
                        </div>
                        <a href="register.jsp" class="create">Create an account</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>

        </div>

        <!--//content-->
        <!--end of content-->
        <!--footer-->
        <jsp:include page="footer.jsp"/>
        <!--end of footer-->
    </body>
</html>
