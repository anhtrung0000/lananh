<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	
%>
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="social">
                <ul>
                    <li><a href="#"><i class="facebok"> </i></a></li>
                    <li><a href="#"><i class="twiter"> </i></a></li>
                    <li><a href="#"><i class="inst"> </i></a></li>
                    <li><a href="#"><i class="goog"> </i></a></li>
                    <div class="clearfix"></div>	
                </ul>
            </div>
            <div class="header-left">

                <div class="search-box">
                    <div id="sb-search" class="sb-search">
                        <form action="SearchProduct_Servlet" method="post">
                            <input class="sb-search-input" placeholder="Mời bạn nhập tên ản phẩm muốn tìm..." type="search" name="search1" >
                            <input class="sb-search-submit" type="submit" value="1" name="submit">
                            <span class="sb-icon-search"> </span>
                        </form>
                    </div>
                </div>
                <!-- search-scripts -->
                <script src="js/classie.js"></script>
                <script src="js/uisearch.js"></script>
                <script>
                    new UISearch(document.getElementById('sb-search'));
                </script>
                <!-- //search-scripts -->

                <div class="ca-r">
                    <div class="cart box_1">
                        <a href="Checkout_Servelet">
                            <h3> <div class="total">
                                    <span><%=session.getAttribute("thanhtien") %></span> </div>
                                <img src="images/cart.png" alt=""/></h3>
                        </a>

                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>

        </div>
    </div>
    <div class="container">
        <div class="head-top">
            <div class="logo">
                <h1><a href="index.jsp">Đệm Minh Nhài</a></h1>
            </div>
            <div class=" h_menu4">
                <ul class="memenu skyblue">
                    <li><a class="color8" href="index.jsp">Danh Mục</a></li>	
                    <li><a class="color1" href="#">Hỗ Trợ</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            

                                        </ul>	
                                    </div>							
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            

                                        </ul>	
                                    </div>							
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            
                                        </ul>	
                                    </div>												
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="grid"><a class="color2" href="#">Chăm Sóc Khách Hàng</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                           

                                        </ul>	
                                    </div>							
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            

                                        </ul>	
                                    </div>							
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            
                                        </ul>	
                                    </div>												
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a class="color4" href="contact.jsp">Liên Hệ</a></li>	
                    
			
                    <li><a class="color6" href="login.jsp" name="login" >Đăng Nhập</a></li>
                </ul> 
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>
</div>

