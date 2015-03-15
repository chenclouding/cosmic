package beans.entities;


public class ItemCheckOut3Bean {
	


	public double kafang; //统计量kafang的值（u0已知）
	public double quantile; //分位点（u0已知）
	public double sigma; //均方差的估计值


	// 分位数 a=0.10
	public static final double[] P090 = { 2.706f, 4.605f, 6.251f, 7.779f,
		9.236f, 10.645f, 12.017f, 13.362f, 14.684f, 15.987f, 17.275f,
		18.549f, 19.812f, 21.064f, 22.307f, 23.542f, 24.769f, 25.989f,
		27.204f, 28.412f, 29.615f, 30.813f, 32.007f, 33.196f, 34.382f,
		35.563f, 36.741f, 37.916f, 39.087f, 40.256f, 41.422f, 42.585f,
		43.745f, 44.903f, 46.059f, 47.212f, 48.363f, 49.513f, 50.600f 
		};
	

	// 分位点 a=0.05
	public static final double[] P095 = { 3.841f, 5.991f, 7.851f, 9.488f,
		11.071f, 12.592f, 14.067f, 15.507f, 16.919f, 18.307f, 19.675f,
		21.026f, 22.362f, 23.685f, 24.996f, 26.296f, 27.587f, 28.869f,
		30.144f, 31.410f, 32.671f, 33.924f, 35.172f, 36.415f, 37.652f,
		38.885f, 40.113f, 41.337f, 42.557f, 43.773f, 44.985f, 46.194f,
		47.400f, 48.602f, 49.802f, 50.998f, 52.192f, 53.384f, 54.572f 
		};

	// 分位点  a=0.01
	public static final double[] P099 = { 6.635f, 9.210f, 11.345f, 13.277f, 
		15.086f, 16.812f, 18.475f, 20.090f, 21.666f, 23.209f, 24.725f,
		26.217f, 27.688f, 29.141f, 30.578f, 32.000f, 33.409f, 34.805f,
		36.191f, 37.566f, 38.932f, 40.289f, 41.638f, 42.980f, 44.314f,
		45.642f, 46.963f, 48.278f, 49.588f, 50.892f, 52.191f, 53.486f,
		54.776f, 56.061f, 57.342f, 58.619f, 59.892f, 61.162f, 62.428f
	};

	public ItemCheckOut3Bean() {
	}


	/**
	 *  单个正态总体均值已知时总体方差的检验
	 *  h0: sigma >= sigma0, h1: sigma < sigma0
	 *  kafang = (1 / sigma0^2) (求和(xi - u0)^2)
	 *  W = {kafang < quantile(1-a)(n)}
	 * @param x 一组样本数据
	 * @param u0 已知总体均值u0
	 * @param sigma0 已知总体方差sigma0
	 * @param a 检验水平，0.01或0.05或0.10
	 * @return 通过检验（h0成立）返回true，反之（h1成立）false
	 */
	public boolean testWithU0(double[] x, double u0, double sigma0, double a) {
		kafang = 0;
		double sigma2 = 0; //sigma平方的估计值
		for (int i = 0; i < x.length; i++)
		{
			sigma2 += (x[i] - u0) * (x[i] - u0);
		}
		kafang = sigma2 / (sigma0 * sigma0); //计算kafang的估计值
		sigma = Math.sqrt(sigma2); //计算sigma的估计值
		int n = x.length;
		if (a >= 0.099f) // a=0.10
		{ 
			quantile = P090[n-1];
		} else if (a >= 0.049f) //a=0.05
		{
			quantile = P095[n-1];
		} else // a=0.01
		{
			quantile = P099[n-1];
		}

		if (kafang > quantile) // 检验kafang没有进入拒绝域
		{
			return true;
		} else {
			return false;
		}
	}

	
	public double getkafang() {
		return kafang;
	}

	public double getquantile() {
		return quantile;
	}

	
	
	
	/**
	 *  单个正态总体均值未知时总体方差的检验
	 *  h0: sigma >= sigma0, h1: sigma < sigma0
	 *  kafang = (1 / sigma0^2) (求和(xi - x_avg)^2)
	 *  W = {kafang < quantile(1-a)(n)}
	 * @param x 一组样本数据
	 * @param sigma0 已知总体方差sigma0
	 * @param a 检验水平，0.01或0.05或0.10
	 * @return 通过检验（h0成立）返回true，反之（h1成立）false
	 */
	public boolean testWithoutU0(double[] x, double sigma0, double a) {
		int n = x.length; 
		double x_average = 0; //计算样本均值
		for (int i = 0; i < n; i++)
		{
			x_average += x[i] / n;
		}
		
		kafang = 0;
		double sigma2 = 0; //sigma平方的估计值
		for (int i = 0; i < x.length; i++) // 求出kafang2的估计值
		{
			sigma2 += (x[i] - x_average) * (x[i] - x_average);
		}
		kafang = sigma2 / (sigma0 * sigma0);
		sigma = Math.sqrt(sigma2);
		
		if (a >= 0.099f) //a=0.1 
		{
			quantile = P090[n-1];
		} else if (a >= 0.049f) //a=0.05
		{
			quantile = P095[n-1];
		} else // a=0.01
		{
			quantile = P099[n-1];
		}

		if (kafang > quantile) // 检验kafang没有进入拒绝域
		{
			return true;
		} else {
			return false;
		}
	}
	
	public double getSigma()
	{
		return sigma;
	}
}
