+++
title = "Instructions"
date = 2019-11-18T17:11:28+11:00
weight =6
+++

In this lab we will build a variety of machine learning models to predict individual consumer electricity demand. 
Using the GluonTS library, we will train several time series models with different algorithms, 
visualize them and  compare them to see which works best with our data set. 
We will also show how to deploy a GluonTS model with SageMaker, and also how to deploy multiple GluonTS models within a single endpoint.

The lab is split into two parts that should be run in order.


## Lab steps

### 1. Login in to AWS
{{< setupsagemaker >}}
{{< sagemakerbyoa >}}


### 2. Go to SageMaker

{{< gotosagemaker >}}


### 3. Create the notebook kernal
Open a terminal and create kernal ***gluonts-multimodel*** for the lab with below bash commands:

```bash
cd ~/SageMaker/timeseries_blog/2_Predict_electricity_demand_with_the_GluonTS_and_SageMaker_custom_containers/
./build_env.sh
```
> Please note that it may take up approx ***20~30mins***.


### 4. Work through the first notebook to create the models
> Be sure to use the previously created 'gluonts-multimodel' kernel.
![](/images/module-forecasting/lab2_notebook_01_predict_electricity_demand_with_the_gluonts_library.png)


### 5. Work through the second notebook to deploy the models
> Be sure to use the previously created 'gluonts-multimodel' kernel.
![](/images/module-forecasting/lab2_notebook_02_deploy_gluonts_forecast_models_as_multi_model_endpoints.png)


### 6. Cleanup
> To ensure all resources are deleted and they wont keep incurring cost afterwards, be sure to run the clean up cells at the end.