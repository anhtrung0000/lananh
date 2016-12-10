<%@page import="DTO.Invoice_DTO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="DTO.Product_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Thông tin đăng ký nhận hàng</title>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<jsp:include page="head.jsp" />
</head>
<script type="text/javascript">
	function checkinfor(){
		var email = document.getElementById("Email").value;
		var name = document.getElementById("Name").value;
		var address = document.getElementById("Address").value;
		var phone = document.getElementById("Phone").value;
		 k = true;
		if( email == ""|| name == "" || address == "" || phone == ""){
			
			k = false;
		}
		if(k == false){
			document.getElementById("erormess").innerHTML = "Mời bạn điền đầy đủ thông tin ";
		}
		return k;
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
	<div class="grow">
		<div class="container">
			<h2>Thông tin đơn hàng</h2>
		</div>
	</div>
	
	
	<!-- grow -->
	<div class="main" style="width: 1200px;">
	<div style="height: 25px; color: red; padding-left: 20px;" id="erormess"></div>
		<div class="wrap clearfix">
		<form action="InforInvoice_Servlet" method="post" onsubmit="return checkinfor()" >
		
			<div class="col-md-4 col-sm-12 customer-info">
				<div>
					<h2>
						<label class="control-label height-40">Thông tin mua hàng</label>
					</h2>
				</div>
				<hr class="divider">
				<div class="form-group">
					<span class="color-red">*</span>
					<input name="Email" id="Email" value="" type="email" class="form-control"
						placeholder="Email"/>
					
					<div>
						<div class="form-group">
							<span class="color-red">*</span>
							<input class="form-control" id="Name" name="Name" placeholder="Họ và tên" />
							
						</div>
						<div class="form-group">
							<span class="color-red">*</span>
							<input name="Phone" id="Phone" class="form-control"
								placeholder="Số điện thoại" />
						</div>

						<div class="form-group">
							<span class="color-red">*</span>
							<input 	name="Address" id="Address" class="form-control"
								placeholder="Địa chỉ" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<textarea name="note" class="form-control" placeholder="Ghi chú"></textarea>
				</div>
			</div>
			<div class="col-md-4 col-sm-12">
				<div>
					<div class="form-group">
						<h2>
							<label class="control-label height-40" style="margin-bottom: 20px;">Vận chuyển</label>
						</h2>
						<div >
							<select class="form-control">
								<option value="1" selected="selected">Giao hàng tận nơi - 40.000đ</option>
							</select> 
						</div>
					</div>
				</div>
				<div class="form-group ">
					<h2>
						<label class="control-label">Thanh toán</label>
					</h2>
					<div class="radio">
						<span>Thanh toán khi giao hàng (COD)</span>
					</div>
				</div>
			</div>
			<!-- Thông tin hóa đơn -->
			<div class="col-md-4 col-sm-12 order-info row">
				<div>
					<h2>
						<label class="control-label height-40">Đơn hàng</label> 
					</h2>
				</div>
				<div >
				<%for(int i = 0; i< listInvoice.size();i++){
										Invoice_DTO pro = new Invoice_DTO();
										pro = listInvoice.get(i);
									%>
					<div class="row">
						<img src='<%=pro.getImages() %>' style="width: 60px;" /> x<%=pro.getTotal() %>
						<span> <strong><%=pro.getProductName() %></strong>
						</span>
						<span><strong class="product-price pull-right" style="height: 50px;line-height: 45px; width: 120px"><%=pro.money() %>₫ </strong></span>
					</div>	
					<%} %>

					<div style="margin-top: 15px;" class="row">
						<div>
							<label><strong >Phí vận chuyển</strong></label>
								<strong style="width: 120px; float: right;">40000₫ </strong>	
						</div>
						<div>
							<span ><strong > Tổng cộng </strong></span> 
							<span><strong style="width: 120px; float: right;">
								<%=session.getAttribute("thanhtien") %>₫</strong> </span>
						</div>
					</div>
				</div>
				<div class="form-group clearfix " style="margin: 20px 20px; text-align: center;">
					<input class="btn " type="submit" name="submit"
						value="ĐẶT HÀNG"/>
				</div>
			</div>
		<!-- hét thông tin hoa đơn -->	
			</form>
		</div>
	</div>
	
	<%
		String a = "";
		if(session.getAttribute("mess") == ""){
			a = "none";
		}else{
			a = "block";
		}
	%>
	<div class="mess" style="display: <%=a%>;">
		<p><%=session.getAttribute("mess") %><br />
			<a href="trangchu" style="color: black; text-decoration: none;">Close</a>
		</p>
		
	</div>
	<!--//content-->
	<!--end of content-->
	<!--footer-->
	<jsp:include page="footer.jsp" />
	<!--end of footer-->
</body>
</html>