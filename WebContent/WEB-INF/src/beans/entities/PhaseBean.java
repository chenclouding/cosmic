/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

/**
 * @author congpz
 *  
 */
public class PhaseBean {
	private int id = 0;

	private String name = null;
	//����˽�б���ȡֵ����get������˽�б�����ֵ����set����
	/**
	 * @return Returns the id.
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            The id to set.
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof PhaseBean){
	    	PhaseBean phaseInfo = (PhaseBean)o;
		    if(phaseInfo.getId() == id){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
	}
}