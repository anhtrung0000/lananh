package DTO;

public class Invoice_DTO extends Product_DTO {
	int  InvoiceId, Total;

	public int getInvoiceId() {
		return InvoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		InvoiceId = invoiceId;
	}

	public int getTotal() {
		return Total;
	}

	public void setTotal(int total) {
		Total = total;
	}
	public String money(){
		return String.format("%.2f", this.getTotal() * super.getPrice());
	}
	
}
