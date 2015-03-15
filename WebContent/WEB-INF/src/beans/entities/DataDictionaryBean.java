/*
 * Created on 2005-1-10 by congpz
 * 
 */
package beans.entities;

/**
 * @author congpz
 *  
 */
public class DataDictionaryBean {

	private String dataType;

	private String dataCode;

	private String dataTypeName;

	private String dataName;
	//初始化数据字典
	public static final String EMPLOYEE_PURVIEW = "000";
	public static final String MANAGER_PURVIEW = "001";
	public static final String DISPATCH_PURVIEW = "002";
	public static final String NORMAL_PURVIEW = "003";
	
	public static final String WBS_SCALE = "002";
	public static final String CYCLE_UNIT = "003";
	public static final String UNIT_HOUR = "001";
	public static final String UNIT_DAY = "002";
	public static final String UNIT_WEEK = "003";
	public static final String UNIT_MONTH = "004";
	
	public static final String WBS_STATE = "004";
	public static final String SUB_WBS_STATE = "005";
	public static final String INITIAL_STATE = "001";
	public static final String DISPATCHED_STATE = "002";
	public static final String START_STATE = "003";
	public static final String PAUSE_STATE = "004";
	public static final String FINISH_STATE = "005";
	public static final String NEXTWEEK_STATE = "006";
	
	public static final String PROJECT_STATE = "006";
	public static final String PROJECT_INITIAL_STATE = "001";
	public static final String PROJECT_START_STATE = "002";
	public static final String PROJECT_PAUSE_STATE = "003";
	public static final String PROJECT_FINISH_STATE = "004";
	
	public static final String SIZE = "008";
	public static final String Type = "007";
	public static final String ProductType = "009";
	
	public static final String WBS_ACTION_TYPE = "010";
	public static final String DEFECT_TYPE = "011";
	
	public static final String EMPLOYEE_TYPE_INITIAL = "000";
	public static final String EMPLOYEE_TYPE_NORMAL = "001";
	public static final String EMPLOYEE_TYPE_CONTRACTOR = "002";
	public static final String EMPLOYEE_TYPE_QUIT = "003";	

	/**
	 * @return Returns the dataCode.
	 */
	//构造私有变量取值方法get（）和私有变量赋值方法set（）
	public String getDataCode() {
		return dataCode;
	}

	/**
	 * @param dataCode
	 *            The dataCode to set.
	 */
	public void setDataCode(String dataCode) {
		this.dataCode = dataCode;
	}

	/**
	 * @return Returns the dataName.
	 */
	public String getDataName() {
		return dataName;
	}

	/**
	 * @param dataName
	 *            The dataName to set.
	 */
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	/**
	 * @return Returns the dataType.
	 */
	public String getDataType() {
		return dataType;
	}

	/**
	 * @param dataType
	 *            The dataType to set.
	 */
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	/**
	 * @return Returns the dataTypeName.
	 */
	public String getDataTypeName() {
		return dataTypeName;
	}

	/**
	 * @param dataTypeName
	 *            The dataTypeName to set.
	 */
	public void setDataTypeName(String dataTypeName) {
		this.dataTypeName = dataTypeName;
	}
	
	public boolean equals(Object o){
	    boolean iResult = false;
	    if(o instanceof DataDictionaryBean){
	    	DataDictionaryBean datadictionaryInfo = (DataDictionaryBean)o;
		    if(datadictionaryInfo.getDataType().equals(dataType) 
		    		&& datadictionaryInfo.getDataCode().equals(dataCode)){
		        iResult = true;
		    }else
		        iResult = false;
		    return iResult;
	    }else
	        return false;
	}

}