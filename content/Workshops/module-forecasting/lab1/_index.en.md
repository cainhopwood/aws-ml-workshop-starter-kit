+++
title = "Forecast air quality with Amazon SageMaker and DeepAR"
date = 2019-11-18T17:11:28+11:00
weight = 10
+++

![](/images/module-forecasting/syd_harb_air.jpg)

<br>

Poor air quality is one of the largest public health threats of our time with 8.8 million deaths each year with 90% occurring in developing countries. Predicting trends in air quality can help enable policy makers to make better day to day decisions and inform the public of possible dangers. Air quality measurements vary with location, season, day of the week, and time of day and also can depend upon other measurements like wind direction and temperature. The  complexity and volume of data involved makes forecasting future air quality values difficult. In addition, traditional techniques like ARIMA, require building separate forecast models for each individual location. Maintaining so many ML models adds further complexity to the production system. Deep neural networks are good at capturing patterns in large complex data sets, and a single model can be trained to work across multiple locations.

<br>
In this lab we will use the Open AQ (air quality) dataset on AWS Open Data Registry and Amazon SageMaker to build a predictive model for air quality. By using the SageMaker DeepAR algorithm, we will build a single machine learning model that will work across multiple cities in Australia. 

The Amazon SageMaker DeepAR forecasting algorithm is a supervised learning algorithm for forecasting scalar (one-dimensional) time series using recurrent neural networks (RNN). Classical forecasting methods, such as autoregressive integrated moving average (ARIMA) or exponential smoothing (ETS), fit a single model to each individual time series. They then use that model to extrapolate the time series into the future.

In many applications, however, you have many similar time series across a set of cross-sectional units. For example, you might have time series groupings for demand for different products, server loads, and requests for webpages. For this type of application, you can benefit from training a single model jointly over all of the time series. DeepAR takes this approach. When your dataset contains hundreds of related time series, DeepAR outperforms the standard ARIMA and ETS methods. You can also use the trained model to generate forecasts for new time series that are similar to the ones it has been trained on.

### ML Pipeline

Step Functions Data Science SDK v2.0.0rc1 is used to create ML pipeline for air quality forecasting. 

### Design

* With default CFN parameter values setup during CFN stack creation, [GitHub Repo - timeseries_blog](https://github.com/glyfnet/timeseries_blog) will be mirrored to CodeCommit repo so that user can experiment code change to trigger pipeline easily.
* CodePipeline pipeline orchestrates the build process with CodeBuild project.
* CodeBuild project process `preprocess` container build and ML Pipeline creation & execution with Step Functions state machine. (***the workflow won't be part of CFN stack, hence, you may manually remove it while deleting CFN stack.***)
* State machine demo ML pipeline and orchestrate data preprocessing, model training/tuning and batch transform.
* Amazon SageMaker Notebook instance can be used to explore notebooks.

![Pipline Design](/images/module-forecasting/aqf-ml-pipeline-design.png)

### Workflow

![workflow](/images/module-forecasting/air_quality_forecasting_ml_pipeline.png)

### Start the lab

Click [here](./step1/) to get started!