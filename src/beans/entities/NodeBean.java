/*
 * Created on 2005-8-7
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;

import java.util.HashSet;
import java.util.Set;



/**
 * @author Blue_Ranger
 *
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class NodeBean {
	String workID;
	boolean isCriticalNode;
	int days;
	int earliestStartTime;
	int earliestEndTime;
	int latestEndTime;
	int latestStartTime;	
	
	Set<NodeBean> previousNode=new HashSet<NodeBean>();
	Set<NodeBean> nextNode=new HashSet<NodeBean>();
	
	public NodeBean(){
		workID="";
		days=0;
		isCriticalNode=false;
		earliestStartTime=-1;
		latestEndTime=-1;
		latestStartTime=-1;
		earliestEndTime=-1;
		nextNode.clear();previousNode.clear();
	}
	public NodeBean(String id,int days){
		workID = id;
		this.days = days;
		earliestStartTime=earliestEndTime=-1;
		latestStartTime=latestEndTime=-1;
		isCriticalNode=false;
		previousNode.clear();
		nextNode.clear();
	}
	public void setDays(int days){
		this.days=days;
	}
	public int getDays(){
		return days;
	}
	public void setEarliestStartTime(int t){
		earliestStartTime=t;
	}
	public int getEarliestEndTime(){
		return earliestEndTime;
	}
	public void setEarliestEndTime(int t){
		earliestEndTime=earliestStartTime+days;
	}
	public int getEarliestStartTime(){
		return earliestStartTime;
	}
	public int getLatestStartTime(){
		return latestStartTime;
	}
	public int getLatestEndTime(){
		return latestEndTime;
	}
	public void setLatestEndTime(int i){
		latestEndTime = i;
	}
	public void setLatestStartTime(int i){
		latestStartTime = i;
	}
	public void setWorkId(String s){
		workID=s;
	}
	public String getWorkId(){
		return workID;
	}
	
	public void setCriticalNode(NodeBean n) {
		if (n.earliestStartTime == n.latestStartTime)
			isCriticalNode = true;
	}
	
	public boolean isCriticalNode(){
		return isCriticalNode;
	}
	public void addPreviousNode(NodeBean nb){
		previousNode.add(nb);
	}
	public void addNextNode(NodeBean nb){
		nextNode.add(nb);
	}
	public Set getPreviousNode(){
		return previousNode;
	}
	public Set getNextNode(){
		return nextNode;
	}
}
