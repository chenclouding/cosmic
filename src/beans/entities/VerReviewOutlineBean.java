/*
 * �������� 2006-7-25
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package beans.entities;

/**
 * @author ������
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
