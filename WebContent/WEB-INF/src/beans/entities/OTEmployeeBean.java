/*
 * Created on 2005-5-13
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package beans.entities;

/**
 * @author Max
 *
 *  * Window - Preferences - Java - Code Style - Code Templates
 */
public class OTEmployeeBean {
		public OTEmployeeBean(){
			}
		
		private String id;
		private String name;
		
		public void setId(String id){
			this.id=id;		
		}
		
		public void setName(String name){
			this.name=name;
		}
		

		public String getId(){
			return id;		
		}
		
		public String getName(){
			return name;
		}
		


}


