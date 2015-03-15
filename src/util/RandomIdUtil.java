package util;

import facades.EmployeeFacade;
import facades.ProjectFacade;

public class RandomIdUtil {
	
	/**
	 * generate random Id between the min and max
	 * @param min
	 * @param max
	 * @return
	 */
	private String generateRandomId(long min, long max) {
		long id;
		id = Math.round(Math.random()*(max-min) + min);			
		return String.valueOf(id);
	}
	 
	/**
	 * generate project Id unused 
	 * @return
	 */
	public String getRandomPrjectId() {
		String projId;
		ProjectFacade pf = new ProjectFacade();
		do {
			projId = generateRandomId(3000000, 9000000);
			//System.out.println(projId);
		} while (pf.getProjectInfoById(projId) != null);
		return projId;
	}
	
	/**
	 * can't work now!
	 * @return
	 */
	public String getRandomEmployeeId() {
		String employeeId;
		EmployeeFacade ef = new EmployeeFacade();
		do {
			employeeId = generateRandomId(0012, 0030);
			System.out.println("id is : " + employeeId);
		} while (ef.isValidateEmployee(employeeId));
		return employeeId;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {		
		RandomIdUtil util = new RandomIdUtil();
//		String id = util.getRandomPrjectId();
		String id = util.getRandomEmployeeId();
		System.out.println(id);
	}

}
