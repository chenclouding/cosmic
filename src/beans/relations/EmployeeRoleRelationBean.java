/*
 * Created on 2005-5-13
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.relations;

/**
 * @author Max
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class EmployeeRoleRelationBean {

	/**
	 * 
	 */
	public EmployeeRoleRelationBean() {		
		
	}

    
        
     /**
     * ����ȫ�����ԵĹ��캯��
     * @param idRole ��ɫid
     * @param idSkill ����id
     */
    
    
    private String idEmployee;
        
    private String idRole;
    
    private String idProject;
   
    public String getIdRole(){
        return idRole;
    }
   
    public void setIdRole(String id){
        this.idRole=id;
    }
    
   
    public String getIdEmployee(){
        return idEmployee;
    }
    
    
    public void setIdEmployee(String id){
        this.idEmployee=id;
    }

    public String getIdProject(){
    	return idProject;
    }
    
    public void setIdProject(String id){
    	this.idProject=id;
    }
}
