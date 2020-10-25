+++
title = "Lab 5: Timeseries Data Forecasting Workshops"
description = "In the workshops, we are going to experiment how to use SageMaker built-in algorithm, Amazon Forecast service and Gluton Timeseries package to do forecasting prediction."
date = 2020-10-15T00:00:00+11:00
weight = 50
chapter = false
difficulty = "Intermediate / Advanced"
CFTemplate = "Workshop-test.yml"
CFTemplateName = "TimeseriesDataForecasting"
time = "5hrs"
inlists = true
+++

In this collection of labs, we will explore how to solve various time-series forecasting problems. Time series analysis applies mathematical techniques to quantities that are ordered by time, in order to find insights about the past as well as the future. Historically, weather forecasting is one of the first time series analysis problem undertaken by humans. Predicting demand for future sales and services, forecasting utilization of compute resources and projecting call volume in call centres are all good examples of other common time series problems. With these four labs we will walk through solving different time series problems using a variety of techniques and AWS services. 

## What is time series analysis?
Time series analysis applies mathematical techniques to quantities that are ordered by time, in order to find insights about the past as well as the future. Historically, weather forecasting is one of the first time series analysis problem undertaken by humans. An early as Neolithic times, civilizations used calendars as a means to predict seasonal patterns for agriculture. Time series problems exist in almost every domain. Predicting demand for future sales and services, forecasting utilization of compute resources and projecting call volume in call centres are all good examples of time series problems.

Many of the methodologies used for time series analysis have been around for a long time. Long before deep learning techniques where even invented, algorithms like ARIMA have been in use since the 1950's. For many problems, these well-developed techniques are still the best way to solve time series problems. The recent exponential growth in data and compute power has spawned the development of machine learning techniques based on neural networks that work well with larger and more complex data sets. One example of this type of data is air quality measurements, which are composed of millions of measurements from hundreds of locations. The DeepAR algorithm developed by Amazon research scientists to do time series forecasting on large data sets of related time series, makes training a forecasting model with this complex data possible.

> **Definitions** Univariate means a single value type. Multivariate means multiple value types. For example, a time series of temperature and humidity is multivariate, whereas a time series of temperature alone is univariate. Many time series algorithms only work with univariate date. Some algorithms work with multivariate data, but only predicts values for a single target value type. The other time series is called the related time series or the "exogenous" time series. The DeepAR algorithm that we will use in this example works with multivariate data, but we will only use univariate air quality data. To improve the quality of the predictive model, we could also use an exogenous time series, such as wind or temperature, but this out of scope for this project.


## Time series labs
This time series workshop is broken into four independent labs that explore applying time series algorithms to a variety of different data sets to solve different use cases.  Each lab will introduce more topics and use cases, so pick the ones of interest to you. Each individual lab also has multiple parts, so you can pick what is more relevant to your role or upcoming project.  It's recommended you start with the first introductory lab on air quality prediction, and then explore other time-series labs to broaden your knowledge.

### Lab Overview

{{< video "apac_pm10_july1_8.mov" >}}

>  **Air Quality Forecasting Lab overview** 

### Workshop scope

The scope of this workshop is to:

* Understand how to do air quality forecasting with Amazon SageMaker built-in algorithm DeepAR
* Understand how to use Step Function Data Science SDK to orchestration ML Pipeline
* Understand how to use GluonTS package and multi-model deployment
* Understand how to use Amazon Forecast with Step Functions for timeseries data forecasting.

{{< sagemakereventengine >}}

### Timeseries Forecasting Labs
{{% children depth="2" %}}

Click [Lab 1 - Forecast air quality with Amazon SageMaker and DeepAR](./lab1/) to get started!

