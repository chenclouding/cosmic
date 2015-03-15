/*
 * CourseBean.java
 *
 * Created on 2005年5月7日, 下午7:55
 */

package beans.entities;

/**
 *
 * @author Max
 */
public class CourseBean {
    
    /** Creates a new instance of CourseBean */
    public CourseBean() {
    }
    
    public CourseBean(String id, String name, String info){
        this.id=id;
        this.name=name;
        this.info=info;
    }
    
    private String id=null;
    private String name=null;
    private String info=null;
    
    
    public String getId(){
        return this.id;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String getInfo(){
        return this.info;
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
    
    public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof CourseBean){
	    	CourseBean courseInfo = (CourseBean)o;
		    if(courseInfo.getId().equals(id)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
    }
}
