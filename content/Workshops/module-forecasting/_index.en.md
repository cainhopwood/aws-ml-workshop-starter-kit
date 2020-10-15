+++
title = "Lab 5: Forecasting Air Quality with Amazon SageMaker and DeepAR"
description = "In this workshop, we are going to build an air quality forecasting application using Amazon SageMaker and the DeepAR algorithm. We will walk through how to define the problem, engineer the features, and train, evaluate and deploy the machine learning model."
date = 2020-10-15T00:00:00+11:00
weight = 50
chapter = false
difficulty = "Intermediate / Advanced"
CFTemplate = "air_quality_forecasting_ml_pipeline.yml"
CFTemplateName = "AirQualityForecastingLab"
time = "2hrs"
inlists = true
+++

Recent bush fire events in Australia is just one reminder of the importance of breathable air. According to the World Health Organization, air pollution is the 4th largest risk factor to human health worldwide, and 90% of the world breathes unhealthy air. Having realiable projections of air quality can help individuals as well as organizations to take steps to mitigate the health affects caused by dangerous air quality levels. For more information on Open AQ's efforts to solve this global issue, visit [Open AQ](https://openaq.org/).

In this workshop, we will build an air quality forecasting model with Amazon SageMaker built-in algorithm.

![Sydney Harbour during hazardous air quality conditions](/images/module-forecasting/syd_harb_air.jpg)

> Sydney Harbour during hazardous air quality conditions

In this workshop, we will demonstrate how to define ML problem, time series data feature engineering and forecasting model tunning, training and evaluation. A forecasting model will be built with [Amazon SageMaker built-in algorithm DeepAR](https://docs.aws.amazon.com/sagemaker/latest/dg/deepar.html). Below is the architecture diagram:

![Forecasting Architecture](/images/module-forecasting/air_quality_forecasting_architecture.png)

For training data, we will be use [OpenAQ](https://registry.opendata.aws/openaq/) data from [Registry of Open Data on AWS](https://registry.opendata.aws), and we will train a model with Sydney's pm10 data. If you want to play with model training for your city, you may consider editing sql query in the notebook.

We are using below process for feature engineering. The purpose is to prepare good features for model training. 

![Feature Engineering](/images/module-forecasting/feature_engineering.png)

We also demonstrate how to do [DeepAR Hyperparameters Optimization and Model Training](https://docs.aws.amazon.com/sagemaker/latest/dg/deepar.html). But, due to the actual model tuning and training are very time consuming and expensive, we prepare an existing model artifact so that you can experiement inference. Talking about inference, the [first lab](https://github.com/glyfnet/timeseries_blog/blob/master/1_Forecasting_Air_Pollution_with_Amazon_SageMaker_and_DeepAR/01_train_and_evaluate_air_quality_deepar_model.ipynb) will be deployed with Endpoint hosting service and in the pipeline demo, we have batch transform for batch inference.

Last but not least, we have create ML pipeline for air quality forecasting with [Step Functions Data Science SDK v2.0.0rc1](https://aws-step-functions-data-science-sdk.readthedocs.io/en/v2.0.0rc1/). We prepare two way to experiment pipeline creation.
1. [Use Jupyter Notebook to manually create ML Pipeline](https://github.com/glyfnet/timeseries_blog/blob/master/1_Forecasting_Air_Pollution_with_Amazon_SageMaker_and_DeepAR/02_manual_ml_pipeline_creation_for_air_quality_forecasting.ipynb)
2. [Automate ML Pipeline creation with AWS Development Tool and Step Functions](https://github.com/glyfnet/timeseries_blog/blob/master/1_Forecasting_Air_Pollution_with_Amazon_SageMaker_and_DeepAR/air_quality_forecasting_ml_pipeline.yml)

Below is the demo ML Pipeline:

![ML Pipeline](/images/module-forecasting/air_quality_forecasting_ml_pipeline.png)

### Lab Overview

{{< video "apac_pm10_july1_8.mov" >}}

>  **Air Quality Forecasting Lab overview** 

### Workshop scope

The scope of this workshop is to:

* Understand how to use data from the Open Data Registry in Amazon SageMaker
* Understand feature engineering for time series data for DeepAR model training
* Understand how to use Amazon SageMaker built in algorithms, specifically for DeepAR
* Understand how to use Step Function Data Science SDK to orchestration ML Pipeline
* Going further: Use the full dataset and setup an hyperparameter job to find the best model

{{< setupsagemaker >}}

### Lab Steps
{{% children depth="2" %}}


Click [here](./step1/) to get started!
