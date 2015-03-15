package beans.entities;


//单个正态总体方差已知时总体均值的检验
import java.text.DecimalFormat; 
public class ItemCheckOut1Bean      
{
	public double x_average;         //         x-u.
	public double u0;                 // U= ————————————————  < > Z      
	public double dert;              //      dert/sqt(n)
	public int n;
	public double U; 
	
	public boolean h;
	public double  a;
	public double  Z;
	
	public boolean res;
	
	public ItemCheckOut1Bean() 
	{
		
	}
	public ItemCheckOut1Bean(double x_average,double u0,double dert,int n,boolean h,double  a)
	{
		this.x_average=x_average;
		this.u0=u0;
		this.dert=dert;
		this.n=n;
		this.h=h;
		this.a=a;
		
	}
	
	public void setX_average(double x_average)
	{
		this.x_average=x_average;
	}
	public void setU0(double u0)
	{
		this.u0=u0;
	}
	public void setDert(double dert)
	{
		this.dert=dert;
	}
	public void setN(int n)
	{
		this.n=n;
	}
	public void setH(boolean h)
	{
		this.h=h;
	}
	public void setA(double a)
	{
		this.a=a;
	}
	
	
	public double getX_average()
	{
		return x_average;
	}
	public double getU0()
	{
		return u0;
	}
	public double getDert()
	{
		return dert;
	}
	public int getN()
	{
		return n;
	}
	public boolean getH()
	{
		return h;
	}
	public double getA()
	{
		return a;
	}
	
	
	public void setZ()
	{
		if(a<=0.011)
		{
			Z=2.325f;
		}
		else if(a<=0.051)
		{
			Z=1.645f;
		}
		else if(a<=0.11)
		{
			Z=1.285f;
		}
		
	}
	public double getZ()
	{
		return Z;
	}
	
	
	public void setMaxU()
	{
	    U=(x_average-u0)/(dert/(double)java.lang.StrictMath.pow(n,1.0/2));
		
	}
	public double getMaxU()
	{
		return U;
	}
	
	public boolean getRes()
	{
	    if(h==true)//拒绝域为U>Z
	    {
	    	if(U<Z)//说明没U没有进入拒绝域 不能拒绝原假设
	    	{
	    		res=true;
	    	}
	    	else
	    	{
	    		res=false;
	    	}
	    }
	    else       //拒绝域为U<Z
	    {
	    	if(U>Z)//说明没U没有进入拒绝域 不能拒绝原假设
	    	{
	    		res=true;
	    	}
	    	else
	    	{
	    		res=false;
	    	}
	    	
	    }
		return res;
	}
}
