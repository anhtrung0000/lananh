<%-- 
    Document   : single
    Created on : Nov 15, 2016, 10:38:39 PM
    Author     : Ghost
--%>

<%@page import="DTO.Product_DTO"%>
<%@page import="DTO.DetailProduct_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BLL.Single_BLL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <jsp:include page="head.jsp"/>
        <script src="js/imagezoom.js"></script>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    </head>
    <body>    
		<%
			ArrayList<DetailProduct_DTO> list= (ArrayList<DetailProduct_DTO>)session.getAttribute("listDetailProduct");
			Product_DTO pro = (Product_DTO)session.getAttribute("inforProduct");
		%>
        <!--header-->
        <jsp:include page="header.jsp"/>
        <!--end of header-->
        <!-- grow -->
        <div class="grow">
            <div class="container">
                <h2>Single</h2>
            </div>
        </div>
        <!-- grow -->
        <div class="product">
            <div class="container">

                <div class="product-price1">
                    <div class="top-sing">
                        <div class="col-md-7 single-top">	
                            <div class="flexslider">
                                <ul class="slides">
                                 <%for(int i=0; i<list.size();i++){ %>
                                    <li data-thumb="<%=list.get(i).getImages() %>">
                                        <div class="thumb-image"> <img src="<%=list.get(i).getImages() %>" data-imagezoom="true" class="img-responsive"> </div>
                                    </li>
                            	<%} %>
                                </ul>
                            </div>

                            <div class="clearfix"> </div>
                            <!-- slide -->


                            <!-- FlexSlider -->
                            <script defer src="js/jquery.flexslider.js"></script>

                            <script>
                                // Can also be used with $(document).ready()
                                $(window).load(function () {
                                    $('.flexslider').flexslider({
                                        animation: "slide",
                                        controlNav: "thumbnails"
                                    });
                                });
                            </script>

                        </div>	
                        <div class="col-md-5 single-top-in simpleCart_shelfItem">
                            <div class="single-para ">
                                <h4><%=pro.getProductName() %></h4>
                                <h5 class="item_price" style="margin-top: 20px;">
                                	<span style="color:#000;">Price:</span> <%=pro.getPrice() %></h5>
                                <p><%=pro.getDecription() %></p>
                                <div class="available">
                                    <ul>
                                        <li>Color: <%=pro.getColor() %></li>
                                        <li class="size-in">Size: <%=pro.getSize() %></li>
                                       
                                    </ul>
                                     <div class="clearfix"> </div>
                                </div>

                                <a href="Checkout_Servelet?checkout=<%=pro.getProductId() %>" class="add-cart item_add">Thêm vào rỏ hàng</a>

                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <!---->
                <div class="clearfix"> </div>
            </div>
        </div>
        </div>
        <!--//content-->
        <!--footer-->
        <jsp:include page="footer.jsp"/>
        <!--end of footer-->
    </body>
</html>
