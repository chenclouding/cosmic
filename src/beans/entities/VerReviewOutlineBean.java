/*
 * 创建日期 2006-7-25
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package beans.entities;

/**
 * @author 党遇晴
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class VerReviewOutlineBean {
	String reviewid;
	String creator;
	String reviewMeeting;
	String reviewStatus;
	String reviewTimes;
	String reviewType;
	String reviewConclusion;
	
	public String getCreator(){
		return creator;
	}
	public String getReviewMeeting(){
		return reviewMeeting;
	}
	public String getReviewStatus(){
		return reviewStatus;
	}
	public String getReviewTimes(){
		return reviewTimes;
	}
	public String getReviewType(){
		return reviewType;
	}
	public String getReviewConclusion(){
		return reviewConclusion;
	}
	public java.lang.String getReviewid()
    {
        return reviewid;
    }

    
    public void setReviewid(java.lang.String reviewid)
    {       
        this.reviewid = reviewid;
    }
	
	public void setCreator(String creator){
		this.creator=creator;
	}
	public void setReviewMeeting(String reviewMeeting){
		this.reviewMeeting=reviewMeeting;
	}
	public void setReviewStatus(String reviewStatus){
		this.reviewStatus=reviewStatus;
	}
	public void setReviewTimes(String reviewTimes){
		this.reviewTimes=reviewTimes;
	}
	public void setReviewType(String reviewType){
		this.reviewType=reviewType;
	}
	public void setReviewConclusion(String reviewConclusion){
		this.reviewConclusion=reviewConclusion;
	}

}
