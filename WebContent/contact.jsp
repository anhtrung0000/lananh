<%-- 
    Document   : contact
    Created on : Nov 15, 2016, 10:27:47 PM
    Author     : Ghost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liên hệ</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <!--header-->
        <jsp:include page="header.jsp"/>
        <!--end of header-->
        <!--content-->
        <!-- grow -->
        <div class="grow">
            <div class="container">
                <h2>Contact</h2>
            </div>
        </div>
        <!-- end of  grow -->
        <!--content-->
        <div class="contact">

            <div class="container">
                <div class="contact-form">

                    <div class="col-md-8 contact-grid">
                        <form action="#" method="post">
                            <input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Name';
                                    }">

                            <input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Email';}">
                            <input type="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Subject';
                                    }">

                            <textarea cols="77" rows="6" value=" " onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Message';
                                    }">Message</textarea>
                            <div class="send">
                                <input type="submit" value="Send">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4 contact-in">

                        <div class="address-more">
                            <h4>Address</h4>
                            <p>The company name,</p>
                            <p>Lorem ipsum dolor,</p>
                            <p>Glasglow Dr 40 Fe 72. </p>
                        </div>
                        <div class="address-more">
                            <h4>Address1</h4>
                            <p>Tel:1115550001</p>
                            <p>Fax:190-4509-494</p>
                            <p>Email:<a href="mailto:contact@example.com"> contact@example.com</a></p>
                        </div>

                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d37494223.23909492!2d103!3d55!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x453c569a896724fb%3A0x1409fdf86611f613!2sRussia!5e0!3m2!1sen!2sin!4v1415776049771"></iframe>
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
