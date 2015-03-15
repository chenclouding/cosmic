package beans.entities;


public class TrainingPlanBean {
	
	/**
	 * Method TrainingPlanBean
	 *
	 *
	 */
	public TrainingPlanBean() {
		// TODO: Add your code here
	}
	
	
	private String idEmployee;	
	private String idCourse;
	private String trainingTime;
	private String trainingLoca;
	private String trainingFunc;
	private String trainingInfo;
	
	private String lev;
        
	public String getIdEmployee()	{
		return idEmployee;		
		}
		
		
	
	
	public String getIdCourse(){
		return idCourse;
		}
		
	public String getTrainingTime(){
		return trainingTime;
		}
		
	public String getTrainingLoca(){
		return trainingLoca;
		
		}
		
	public String getTrainingFunc(){
		return trainingFunc;
		}
		
	public String getTrainingInfo(){
		return trainingInfo;
		}
		
	
	public String getLev(){
                return lev;
        }
        
       
	public void setIdEmployee(String idEmployee){
		this.idEmployee=idEmployee;
		}
		
	
		
	public void setIdCourse(String idCourse){
		this.idCourse=idCourse;
		}
		
	public void setTrainingTime(String trainingTime){
		this.trainingTime=trainingTime;
		}
		
	public void setTrainingLoca(String trainingLoca){
		this.trainingLoca=trainingLoca;
		}
		
	public void setTrainingFunc(String trainingFunc){
		this.trainingFunc=trainingFunc;
		}
		
	public void setTrainingInfo(String trainingInfo){
		this.trainingInfo=trainingInfo;
		}
		
	
        
        public void setLev(String lev){
                this.lev=lev;
        }
	
}
