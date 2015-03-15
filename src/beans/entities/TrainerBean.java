/*
 * TrainerBean.java
 *
 * Created on 2005年5月8日, 下午3:17
 */

package beans.entities;

/**
 *
 * @author Max
 */
public class TrainerBean {
    
    /** Creates a new instance of TrainerBean */
    public TrainerBean() {
    }
    
    private String id=null;
    private String name=null;
    private String info=null;
    private String other=null;
    
    public String getId(){
        return this.id;
    }
    
    public String getName(){
        return this.name;
    }
    
    public String getInfo(){
        return this.info;
    }
    
    public String getOther(){
        return this.other;
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
    
    public void setOther(String other){
        this.other=other;
    }
    
    
}
