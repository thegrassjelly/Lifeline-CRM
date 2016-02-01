using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Telerik.Web.UI;

/// <summary>
/// A namespace that provides functionality for plotting a regression model with RadHtmlChart
/// </summary>
namespace RegressionModels
{
    /// <summary>
    /// An enum that lists the supported regression model types
    /// </summary>
    public enum RegressionType
	{
		Linear = 0,
		Logarithmic = 1
	}

	/// <summary>
	/// A class that stores the regression model functionality
	/// </summary>
	public static class CreateRegressionModel
	{
		/// <summary>
		/// Creates a regression model out of an existing data source within the RadHtmlChart control.
		/// </summary>
		/// <param name="HtmlChart">The RadHtmlChart instance.</param>
		/// <param name="DataSource">The DataTable data source.</param>
		/// <param name="DataFieldX">The name of the column in the data source that stores the x-values. </param>
		/// <param name="DataFieldY">The name of the column in the data source that stores the y-values.</param>
		/// <param name="RegressionModelType">The type of the regression model.</param>
		public static void Plot(RadHtmlChart HtmlChart, DataTable DataSource, string DataFieldX, string DataFieldY, RegressionType RegressionModelType)
		{
			//Calculate a and b coefficients
			double[] estimators = OrdinaryLeastSquares(DataSource, DataFieldX, DataFieldY, RegressionModelType);
			double slope = estimators[0];
			double intercept = estimators[1];
			double rSquared = estimators[2];
			//Add x and y estimates
			string estYFieldName = "__Yest";
			string estXFieldName = "__Xest";
			AddRegressionFields(DataSource, DataFieldX, DataFieldY, estXFieldName, estYFieldName, slope, intercept, RegressionModelType);

			//Form the equation, used for the series name
			string equationSeriesName = FormatStringEquation(RegressionModelType, slope, intercept, rSquared);

			//Add a new series with the regression line
			AddRegressionSeries(HtmlChart, estXFieldName, estYFieldName, equationSeriesName);
			//Data bind the chart to the new data source
			HtmlChart.DataSource = DataSource;
			HtmlChart.DataBind();
		}
		/// <summary>
		/// The method which does the actual calculations for the X and Y estimators, a and b parameters and r-squared.
		/// </summary>
		private static double[] OrdinaryLeastSquares(DataTable dt, string xField, string yField, RegressionType regressionType)
		{
			List<string> auxiliaryFields = new List<string>();
			//Calculate a and b parameters
			if (regressionType == RegressionType.Logarithmic)
			{
				dt.Columns.Add("__LnX", typeof(double));
				dt.Rows.Cast<DataRow>().ToList().ForEach(r => r.SetField("__LnX", Math.Log((double)r[xField])));
				xField = "__LnX";
				//auxiliaryFields.Add("__LnX");
			}
			dt.Columns.Add("__XY", typeof(double), string.Format("{0} * {1}", xField, yField));
			dt.Columns.Add("__X2", typeof(double), string.Format("{0} * {0}", xField));
			dt.Columns.Add("__Y2", typeof(double), string.Format("{0} * {0}", yField));
			auxiliaryFields.AddRange(new string[] { "__XY", "__X2", "__Y2" });

			double xSum = (double)dt.Compute(string.Format("SUM([{0}])", xField), "");
			double ySum = (double)dt.Compute(string.Format("SUM([{0}])", yField), "");

			double xAvg = (double)dt.Compute(string.Format("AVG([{0}])", xField), "");
			double yAvg = (double)dt.Compute(string.Format("AVG([{0}])", yField), "");

			double xySum = (double)dt.Compute("SUM([__XY])", "");
			double x2Sum = (double)dt.Compute("SUM([__X2])", "");
			double y2Sum = (double)dt.Compute("SUM([__Y2])", "");

			int n = dt.Rows.Count;

			double slope = (n * xySum - xSum * ySum) / (n * x2Sum - xSum * xSum);
			double intercept = yAvg - slope * xAvg;

			//Calculate r-squared
			dt.Columns.Add("__SSTField", typeof(double), string.Format("({0} - {1}) * ({0} - {1})", yField, yAvg));
			dt.Columns.Add("__Yest_Orig", typeof(double), string.Format("{0} * {1} + {2}", slope, xField, intercept));
			dt.Columns.Add("__SSEField", typeof(double), string.Format("({0} - __Yest_Orig) * ({0} - __Yest_Orig)", yField));
			
			double SST = (double)dt.Compute("SUM([__SSTField])", "");
			double SSE = (double)dt.Compute("SUM([__SSEField])", "");
			auxiliaryFields.AddRange(new string[] { "__SSTField", "__SSEField" });

			double rSquarred = 1 - SSE / SST;

			RemoveAuxiliaryFields(dt, auxiliaryFields);

			return new double[] { slope, intercept, rSquarred };
		}
		/// <summary>
		/// This method removes the auxiliary fields.
		/// </summary>
		private static void RemoveAuxiliaryFields(DataTable dt, List<string> auxiliaryField)
		{
			foreach (string field in auxiliaryField)
			{
				dt.Columns.Remove(field);
			}
		}
		/// <summary>
		/// This method add creates the data source fields for the x and y values to plot the regression model.
		/// </summary>
		private static void AddRegressionFields(DataTable dt, string xField, string yField, string XestField, string YestField, double slope, double intercept, RegressionType RegressionModelType)
		{
			int n = dt.Rows.Count;
			double xMin = (double)dt.Compute(string.Format("Min([{0}])", xField), "");
			double xMax = (double)dt.Compute(string.Format("Max([{0}])", xField), "");
			double step = (xMax - xMin) / (n - 1);
			double cumulative = xMin;
			dt.Columns.Add(XestField, typeof(double));
			dt.Columns.Add(YestField, typeof(double));
			for (int i = 0; i < n; i++)
			{
				if (RegressionModelType == RegressionType.Logarithmic) 
				{
					dt.Rows[i][YestField] = Math.Log(cumulative) * slope + intercept;
				}
				else
				{
					dt.Rows[i][YestField] = cumulative * slope + intercept;
				}
				dt.Rows[i][XestField] = cumulative;
				cumulative += step;
			}
		}
		/// <summary>
		/// The method which creates the equation with the a and b coefficients and r-squared. It is used in the legend.
		/// </summary>
		private static string FormatStringEquation(RegressionType regressionType, double slope, double intercept, double rSquared)
		{
			string XName = "X";
			if (regressionType == RegressionType.Logarithmic)
			{
				XName = "Ln(X)";
			}

			return string.Format("Y = {0} * {3} + {1}\\nR-Squared: {2}", Math.Round(slope, 4), Math.Round(intercept, 4), Math.Round(rSquared, 4), XName);
		}
		/// <summary>
		/// The method which adds the regression model series.
		/// </summary>
		private static void AddRegressionSeries(RadHtmlChart chart, string xField, string yField, string seriesName)
		{
			ScatterLineSeries scatterLineSeries1 = new ScatterLineSeries();
			scatterLineSeries1.Name = seriesName;
			scatterLineSeries1.DataFieldX = xField;
			scatterLineSeries1.DataFieldY = yField;
			scatterLineSeries1.LabelsAppearance.Visible = false;
			scatterLineSeries1.MarkersAppearance.Visible = false;
			chart.PlotArea.Series.Add(scatterLineSeries1);
		}
	}
}