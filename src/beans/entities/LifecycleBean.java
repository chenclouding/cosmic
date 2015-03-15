/*
 * Created on 2005-1-4 by congpz
 * 
 */
package beans.entities;

import java.util.ArrayList;
import java.util.Collection;

/**
 * @author congpz
 *  
 */
public class LifecycleBean {

	private int id = 0;

	private String name = null;

	private Collection phases = new ArrayList();
	
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
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

	/**
	 * @return Returns the phases.
	 */
	public Collection getPhases() {
		return phases;
	}

	/**
	 * @param phases
	 *            The phases to set.
	 */
	public void setPhases(Collection phases) {
		this.phases = phases;
	}
	
	public void addPhase(PhaseBean phase){
		phases.add(phase);
	}
}