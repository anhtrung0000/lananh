<%-- 
    Document   : index
    Created on : Nov 15, 2016, 9:55:39 PM
    Author     : Ghost
--%>

<%@page import="DTO.Invoice_DTO"%>
<%@page import="DTO.Product_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BLL.index_BLL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đệm Minh Nhài xin kính chào quý khách!</title>
<jsp:include page="head.jsp" />
</head>
<%
		if(session.getAttribute("thanhtien") == null){
			session.setAttribute("thanhtien",0);
		}
		session.setAttribute("mess","");
		ArrayList<Invoice_DTO> listInvoice = new ArrayList<Invoice_DTO>();
		if(session.getAttribute("listInvoice") == null){
			session.setAttribute("listInvoice", listInvoice);
		}
		
    	index_BLL index= new index_BLL();
    	ArrayList<Product_DTO> list= index.getListbestseller();
    	ArrayList<Product_DTO> listnew= index.getListnewProduct();
    %>
<body>
	<!--header-->
	<jsp:include page="header.jsp" />
	<div class="banner">
		<div class="container">
			<script src="js/responsiveslides.min.js"></script>
			<script>
                    $(function () {
                        $("#slider").responsiveSlides({
                            auto: true,
                            nav: true,
                            speed: 500,
                            namespace: "callbacks",
                            pager: true,
                        });
                    });
                </script>
			<div id="top" class="callbacks_container">
				<ul class="rslides" id="slider">
					<li>
						<div class="banner-text">
							<h3>Lorem Ipsum is</h3>
							<p>Contrary to popular belief, Lorem Ipsum is not simply
								random text. It has roots in a piece of classical Latin
								literature from 45 BC.</p>
						</div>
					</li>
					<li>
						<div class="banner-text">
							<h3>There are many</h3>
							<p>Popular belief Contrary to , Lorem Ipsum is not simply
								random text. It has roots in a piece of classical Latin
								literature from 45 BC.</p>
						</div>
					</li>
					<li>
						<div class="banner-text">
							<h3>Sed ut perspiciatis</h3>
							<p>Lorem Ipsum is not simply random text. Contrary to popular
								belief, It has roots in a piece of classical Latin literature
								from 45 BC.</p>
						</div>
					</li>
				</ul>
			</div>

		</div>
	</div>

	<!--content-->
	<div class="container">
		<div class="cont">
			<div class="content">
				<div class="content-top-bottom">
					<h2>Các sản phẩm nổi bật</h2> 
					<div class="col-md-6 men">
						<a href="Single?ID=<%=list.get(0).getProductId() %>"
							class="b-link-stripe b-animate-go  thickbox"><img
							class="img-responsive" src="<%=list.get(0).getImages() %>" alt="">
							<div class="b-wrapper">
								<h3 class="b-animate b-from-top top-in   b-delay03 ">
									<span><%=list.get(0).getProductName() %>
									</span>
								</h3>
							</div> 
						</a>
					</div>
					 <div class="col-md-6">
                        <div class="col-md1 ">
                            <a href="/Single?ID=<%=list.get(1).getProductId() %>" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="<%=list.get(1).getImages() %>" alt="">
                                <div class="b-wrapper">
                                    <h3 class="b-animate b-from-top top-in1   b-delay03 ">
                                        <span><%=list.get(1).getProductName() %></span>	
                                    </h3>
                                </div>
                            </a>

                        </div>
                        <div class="col-md2">
                            <div class="col-md-6 men1">
                                <a href="Single?ID=<%=list.get(2).getProductId() %>" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="<%=list.get(2).getImages() %>" alt="">
                                    <div class="b-wrapper">
                                        <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                            <span><%=list.get(2).getProductName() %></span>	
                                        </h3>
                                    </div>
                                </a>

                            </div>
                            <div class="col-md-6 men2">
                                <a href="Single?ID=<%=list.get(3).getProductId() %>" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="<%=list.get(3).getImages() %>" alt="">
                                    <div class="b-wrapper">
                                        <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                            <span><%=list.get(3).getProductName() %></span>	
                                        </h3>
                                    </div>
                                </a>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
				</div>
				<div class="content-top">
					<h1>Sản phẩm mới</h1>
					<div class="grid-in">
						<div class="col-md-3 grid-top simpleCart_shelfItem">
							<a href="Single?ID=<%=listnew.get(0).getProductId() %>"
								class="b-link-stripe b-animate-go  thickbox"><img
								class="img-responsive" src="<%=listnew.get(0).getImages() %>"
								alt="">
								<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>Chi Tiết</span>
									</h3>
								</div> </a>
							<p>
								<a href="/Single?ID=<%=listnew.get(0).getProductId() %>"><%=listnew.get(0).getProductName() %></a>
							</p>
							<a href="#" class="item_add"><p class="number item_price">
									<i> </i><%=listnew.get(0).getPrice()%></p></a>
						</div>
						<div class="col-md-3 grid-top simpleCart_shelfItem">
							<a href="Single?ID=<%=listnew.get(1).getProductId() %>"
								class="b-link-stripe b-animate-go  thickbox"><img
								class="img-responsive" src="<%=listnew.get(1).getImages() %>"
								alt="">
								<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>Chi Tiết</span>
									</h3>
								</div> </a>
							<p>
								<a href="Single?ID=<%=listnew.get(1).getProductId() %>"><%=listnew.get(1).getProductName() %></a>
							</p>
							<a href="#" class="item_add"><p class="number item_price">
									<i> </i><%=listnew.get(1).getPrice()%></p></a>
						</div>
						<div class="col-md-3 grid-top simpleCart_shelfItem">
							<a href="Single?ID=<%=listnew.get(2).getProductId() %>"
								class="b-link-stripe b-animate-go  thickbox"><img
								class="img-responsive" src="<%=listnew.get(2).getImages() %>"
								alt="">
								<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>Chi Tiết</span>
									</h3>
								</div> </a>
							<p>
								<a href="/Single?ID=<%=listnew.get(2).getProductId() %>"><%=listnew.get(2).getProductName() %></a>
							</p>
							<a href="#" class="item_add"><p class="number item_price">
									<i> </i><%=listnew.get(2).getPrice()%></p></a>
						</div>
						<div class="col-md-3 grid-top">
							<a href="Single?ID=<%=listnew.get(3).getProductId() %>"
								class="b-link-stripe b-animate-go  thickbox"><img
								class="img-responsive" src="<%=listnew.get(3).getImages() %>"
								alt="">
								<div class="b-wrapper">
									<h3 class="b-animate b-from-left    b-delay03 ">
										<span>Chi Tiết</span>
									</h3>
								</div> </a>
							<p>
								<a href="Single?ID=<%=listnew.get(3).getProductId() %>"><%=listnew.get(3).getProductName() %></a>
							</p>
							<a href="#" class="item_add"><p class="number item_price">
									<i> </i><%=listnew.get(3).getPrice()%></p></a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!----->
		</div>
		<!---->
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>

