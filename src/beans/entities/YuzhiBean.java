package beans.entities;


public class YuzhiBean {
	private String projectId;
	private String ruleName;
	private double warValue;
	private double modValue;
	private int Rule;
	
	public String getProjectId(){
		return projectId;
	}
	public String getRuleName(){
		return ruleName;
	}
	public double getWarValue(){
		return warValue;
	}
	public double getModValue(){
		return modValue;
	}
	public int getRule(){
		return Rule;
	}
	public void setProjectId(String s){
		projectId=s;
	}
	public void setRuleName(String s){
		ruleName=s;
	}
	public void setWarValue(double d){
		warValue=d;
	}
	public void setModValue(double d){
		modValue=d;
	}
	public void setRule(int i){
		Rule=i;
	}
}
