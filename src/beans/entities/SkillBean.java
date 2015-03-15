/*
 * SkillInfo.java
 *
 * Created on 2005��5��5��, ����8:52
 */

package beans.entities;

/**
 * �������ɼ���ʵ�壬�����ݿ��еĽ�ɫ���Ӧ
 * @author Max
 */
public class SkillBean {
    
    /** Creates a new instance of SkillInfo */
    public SkillBean() {
    }
    
     /**
      * �������ü���id�Ĺ��캯��
      * @param id ����id
      */
     public SkillBean(String id) {
         this.id=id;         
    }
     
     public SkillBean(String id, String name, String info){
        this.id=id;
        this.info=info;
        this.name=name;
     }
    
    private String id=null;
    
    private String name=null;
    
    private String info=null;
            
    /**
     * ����id
     * @return ����id
     */
    public String getId(){
        return id;
    }
    
    /**
     * ����id
     * @param id ����id
     */
    public void setId(String id){
        this.id=id;
    }
    
    /**
     * ���ؼ�������
     * @return ���ؼ�������
     */
    public String getName(){
        return name;
    }
    
    /**
     * ��������
     * @param name ��������
     */
    public void setName(String name){
        this.name=name;
    }
    
    /**
     * ���ؼ�����Ϣ
     * @return ���ؼ�����Ϣ
     */
    public String getInfo(){
        return info;
    }
    
    /**
     * ���ü�����Ϣ
     * @param info ������Ϣ
     */
    public void setInfo(String info){
        this.info=info;
    }
    
    /**
     * �жϴ�������Ƿ�Ϊ��һ�����ܶ����Ƿ���ͬ
     * @param o ����
     * @return ���ز���ֵ����ͬ�򷵻�1�����򷵻�0
     */
    public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof SkillBean){
	    	SkillBean skillInfo = (SkillBean)o;
		    if(skillInfo.getId().equals(id)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
    }
}
