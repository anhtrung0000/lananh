<%@page import="DTO.Invoice_DTO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="DTO.Product_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách sản phẩm bạn muốn tìm</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<jsp:include page="head.jsp" />
</head>
	<%
	ArrayList<Product_DTO> listSearch = new ArrayList<>();
	listSearch = (ArrayList<Product_DTO>)session.getAttribute("listSearch");
    %>
	<!--header-->
	<jsp:include page="header.jsp" />
	<!--end of header-->
	<!--content-->
	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>Sản phẩm được tìm thấy</h2>
			
		</div>
	</div>
	<!-- grow -->
	<div class="container">
		<div class="col-main">
			<div class="container">
				<div class="container-inner">
					<div class="cart">
						<div class="page-title title-buttons"
							style="margin-top: 50px; ">							
						</div>
						<div class="searchpro">
						<%
							for(int i = 0; i< listSearch.size(); i++){
								Product_DTO pro = new Product_DTO();
								pro = listSearch.get(i);
						%>
							<div class="pro">
								<div class="pro-img">
									<a href="Single?ID=<%=pro.getProductId()%>">
										<img alt="" src="<%=pro.getImages()%>">
									</a>
								</div>
								<div class="pro-name">
									<a href="Single?ID=<%=pro.getProductId()%>">
										<strong><%=pro.getProductName() %></strong>
									</a>
								</div>
							</div>
							<div style="margin-bottom: 10px;"></div>	
						<%
							}
						%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//content-->
	<!--end of content-->
	<!--footer-->
	<jsp:include page="footer.jsp" />
	<!--end of footer-->
</body>
</html>
