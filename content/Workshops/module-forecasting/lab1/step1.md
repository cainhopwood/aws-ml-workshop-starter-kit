+++
title = "Instructions"
date = 2019-11-18T17:11:28+11:00
weight =6
+++

The lab is split into two parts that can be run independently.

#### Train and evaluate the air quality DeepAR model
The first lab covers the data science process for creating and evaluating a model:
- Defining timeseries problems
- Querying raw data with Athena
- Timeseries feature engineering
- Model training, tuning and evaluation with SageMaker

#### Machine learning pipeline creation for air quality 
The second lab covers creating the ML production system:
- Architecture design
- Feature engineering with SageMaker pipelines
- SageMaker Batch transforms
- Step functions integration with SageMaker


## Lab steps

### 1. Login to AWS
{{< setupsagemaker >}}
{{< sagemakerbyoa >}}


### 2. Go to SageMaker

{{< gotosagemaker >}}


### 3. Open the notebook 

#### Use this notebook to train the time-series model

![](/images/module-forecasting/lab1_notebook_01_train_and_evaluate_air_quality_deepar_model.png)


#### Use this notebook to create the batch pipeline

![](/images/module-forecasting/lab1_notebook_02_manual_ml_pipeline_creation_for_air_quality_forecasting.png)


### 4. Select the right kernel
Choose the kernal to be "conda_python3". 


### 5. Follow the notebook instructions
You can now follow the instructions in the notebook to keep going.
> To ensure all resources are deleted and they wont keep incurring cost afterwards, be sure to run the clean up cells at the end.