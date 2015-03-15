package beans.entities;

import java.sql.Date;

public class ProductInfoBean {
	String projectId;

	private int productId = 0;
	
	private double productScale = 0;

	String wbsId;

	String productName;

	Date endTime;

	int workScale;
	
	private String functionary = null;
	
	private String functionaryId = null;
	
	private String productType = null;

	public String getProjectId() {
		return projectId;
	}

	
	public String getWbsId() {
		return wbsId;
	}

	public String getProdectName() {
		return productName;
	}

	public int getWorkScale() {
		return workScale;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	

	public void setWbsId(String wbsId) {
		this.wbsId = wbsId;
	}

	public void setProductName(String name) {
		this.productName = name;
	}

	public void setEndTime(Date dt) {
		this.endTime = dt;
	}

	public void setScale(int i) {
		this.workScale = i;
	}

	public Date getEndTime() {
		// TODO Auto-generated method stub
		return endTime;
	}

	public String getFunctionary() {
		return functionary;
	}

	public void setFunctionary(String functionary) {
		this.functionary = functionary;
	}

	public String getFunctionaryId() {
		return functionaryId;
	}

	public void setFunctionaryId(String functionaryId) {
		this.functionaryId = functionaryId;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setWorkScale(int workScale) {
		this.workScale = workScale;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public double getProductScale() {
		return productScale;
	}


	public void setProductScale(double productScale) {
		this.productScale = productScale;
	}
}
