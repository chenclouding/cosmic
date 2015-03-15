package javaBeans.fsm;

import java.io.Serializable;

public class ProjectMeasureBean implements Serializable{
	
	private Integer productId;
	private Integer layerId;
	private Integer peerCompId;
	private Integer interestObjId;
	private Integer funcProsId;
	
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getLayerId() {
		return layerId;
	}
	public void setLayerId(Integer layerId) {
		this.layerId = layerId;
	}
	public Integer getPeerCompId() {
		return peerCompId;
	}
	public void setPeerCompId(Integer peerCompId) {
		this.peerCompId = peerCompId;
	}
	
	public Integer getInterestObjId() {
		return interestObjId;
	}
	public void setInterestObjId(Integer interestObjId) {
		this.interestObjId = interestObjId;
	}
	public Integer getFuncProsId() {
		return funcProsId;
	}
	public void setFuncProsId(Integer funcProsId) {
		this.funcProsId = funcProsId;
	}


}
