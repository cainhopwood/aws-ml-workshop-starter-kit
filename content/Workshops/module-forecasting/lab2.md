+++
title = "Lab 2 - Predict electricity demand with GluonTS"
date = 2019-11-18T17:11:28+11:00
weight = 20
+++


## Overview

![](/images/module-forecasting/electric_power_meter.jpg)

A common problem in many organisations is the need to accurately predict resource demand in order to pro-actively up scale and down scale supply to minimize costs while maintaining adequate service. Within AWS, this capability is essential to the cost-efficient
provisioning of resources like compute and storage. This is also important within utility providers for gas, electricity, water or broadband. With a predictive model that works for individual consumers, resource providers can execute pre-emptive actions that will avoid under or over supply. There are several algorithms that can be used to solve time series problems. Different algorithms may be better for certain problems or even the same problem during different time periods.  

In this lab we will build a variety of machine learning models to predict individual consumer electricity demand. Using the GluonTS library, we will train several time series models with different algorithms, visualize them and  compare them to see which works best with our data set. We will also show how to deploy a GluonTS model with SageMaker, and also how to deploy multiple GluonTS models within a single endpoint. 

### Get started
The lab is split into two parts that should be run in order.

First of all, open a terminal and create kernal ***gluonts-multimodel*** for the lab with below bash commands:

```bash
cd ~/SageMaker/timeseries_blog/2_Predict_electricity_demand_with_the_GluonTS_and_SageMaker_custom_containers/
./build_env.sh
```

> Please note that it may take up approx ***20~30mins***.

#### Predict electricity demand with GluonTS
The first lab covers creating and evaluating multiple GluonTS models:

- Mean: Uses the mean in the training data to predict the next 24 hours.
- Seasonal Naive: Uses the last 24-hour observations to predict the next 24 hours.
- Exponential smoothing (ETS): Uses the weighted combinations of past observations to predict the next 24 hours.
- Prophet: Forecasting time series data based on an additive model where non-linear trends are fit with yearly, weekly, and daily seasonality, plus holiday effects.
- DeepAR: Probabilistic forecasting with autoregressive recurrent networks.

##### To star the lab

![](/images/module-forecasting/lab2_notebook_01_predict_electricity_demand_with_the_gluonts_library.png)

#### Deploy GluonTS as multi-model endpoints
The second lab explores how to host multiple GluonTS models at the same time using a single endpoint:
- Multi Model Server framework
- SageMaker Inference Toolkit
- SageMaker bring your own container

##### To star the lab

![](/images/module-forecasting/lab2_notebook_02_deploy_gluonts_forecast_models_as_multi_model_endpoints.png)
