/*
 * Created on 2006-3-3
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;

/**
 * @author feifei
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class TrainingRefBean {
	
	public TrainingRefBean(){		
	}
	
	private String id = null;
	private String name = null;
	private String info = null;
	private String type = null;
	private double cost = 0;
	
	public String getId(){
		return this.id;
	}

	public String getName(){
		return this.name;
	}
	
	public String getInfo(){
		return this.info;
	}
	
	public String getType(){
		return this.type;
	}
	
	public double getCost(){
		return this.cost;
	}
	
	public void setId(String id){
		this.id=id;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public void setInfo(String info){
		this.info=info;
	}
	
	public void setType(String type){
		this.type=type;
	}
	
	public void setCost(double cost){
		this.cost=cost;
	}
}
