<%@page import="DTO.Invoice_DTO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="DTO.Product_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Giỏ hàng</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<jsp:include page="head.jsp" />
</head>
<script type="text/javascript">
    	function showTotal(i){
    		var a = document.getElementsByClassName("giasp");
    		var b = document.getElementsByClassName("soluog");
    		var c = a[i].innerHTML * b[i].value;
    		var ct = document.getElementsByClassName("price");
    		ct[i].innerHTML = c;
    	}
    </script>
<body>
	<%
    ArrayList<Invoice_DTO> listInvoice = new ArrayList<>();
    listInvoice = (ArrayList<Invoice_DTO>)session.getAttribute("listInvoice");
    %>
	<!--header-->
	<jsp:include page="header.jsp" />
	<!--end of header-->
	<!--content-->
	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>Giỏ hàng của bạn</h2>
			
		</div>
	</div>
	<!-- grow -->
	<div class="container">
		<div class="col-main">
			<div class="container">
				<div class="container-inner">
					<div class="cart">
						<div class="page-title title-buttons"
							style="margin-top: 50px; margin-bottom: 50px;">
							<h1>Giỏ hàng</h1>
							<h5 style="color: red;" id="erors"><%=session.getAttribute("error") %></h5>
						</div>

						<form action="Checkout_Servelet" method="post" name="form1">
							<fieldset id="shopping-cart-table">
								<table class=" table-bordered table-striped table-condensed"
									style="width: 100%">
									<thead>
										<tr>
											<th class="a-center">Ảnh sản phẩm</th>
											<th class="a-center">Tên sản phẩm</th>
											<th class="a-center">Giá</th>
											<th class="a-center">Số lượng</th>
											<th class="a-center">Tổng tiền</th>
											<th style="text-align: center;">Xóa</th>
										</tr>
									</thead>
									<tbody>
										<%for(int i = 0; i< listInvoice.size();i++){
										Invoice_DTO pro = new Invoice_DTO();
										pro = listInvoice.get(i);
									%>

										<tr>
											<td data-title="Ảnh" class="a-center"><a
												href="Single?ID=<%=pro.getProductId() %>"
												class="product-image"> <img src="<%=pro.getImages() %>">
											</a></td>
											<td data-title="Tên sản phẩm" class="a-center">
												<h2>
													<a href="Single?ID=<%=pro.getProductId() %> "
														style="font-size: 14px; text-transform: none; font-weight: 400; color: #000;">
														<%=pro.getProductName() %></a>
												</h2>

											</td>
											<td data-title="Giá" class="a-center"><span
												class="giasp"><%=pro.getPrice() %></span></td>
											<td data-title="Số lượng" class="a-center">
												<input
													value="<%=pro.getTotal() %>" name="lines<%=i %>" size="4"
													class="input-text qty soluog" maxlength="12"
													onchange="showTotal(<%=i %>)" /></td>
											<td data-title="Tổng giá" class="a-center"><span
												class="cart-price"> <span class="price"><%=pro.money()%></span>
											</span></td>
											<td data-title="Xóa" class="a-center"><a
												href="Checkout_Servelet?remove=<%=i %>"
												class="btn-remove btn-remove2">x</a></td>
										</tr>
										<%} %>

									</tbody>

								</table>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
									style="padding: 15px 0px;">
									<div class="total-left col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<a href="trangchu">Tiếp tục mua sắm</a> <input type="submit"
											value="Update" name="submit" />
									</div>
									<div class="total col-sm-6 col-md-6 col-xs-12 ">
										<div class="inner">
											<table class="table shopping-cart-table-total"
												id="shopping-cart-totals-table">
												<tbody>
													<tr>
														<td>Thành tiền</td>
														<td class="a-right"><strong><span
																class="cl_price fs18" id="tongtien"><%=session.getAttribute("thanhtien") %></span></strong></td>
													</tr>
												</tbody>

											</table>
											<div class="checkout">
												<a href="Checkout_Servelet?thanhtoan=1"><button class=" btn-update" title="Tiến hành thanh toán"
													type="button">
													Tiến hành thanh toán
												</button></a>
												<div></div>

											</div>

										</div>

									</div>
								</div>
							</fieldset>
						</form>

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
