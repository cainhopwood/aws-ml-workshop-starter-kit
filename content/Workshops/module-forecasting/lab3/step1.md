+++
title = "Instructions"
date = 2019-11-18T17:11:28+11:00
weight =6
+++

The lab is split into four parts that should be run in order.


## Lab steps

### 1. Login in to AWS
{{< setupsagemaker >}}
{{< sagemakerbyoa >}}


### 2. Go to SageMaker

{{< gotosagemaker >}}

#### The notebooks for this lab are located here:
![](/images/module-forecasting/lab3_notebooks.png)


### 3. Select the right kernel
Be sure to use the 'conda_python3' kernel, which is the default one.


### 4. Follow the notebook instructions
You can now follow the instructions in the notebook to keep going.
> To ensure all resources are deleted and they wont keep incurring cost afterwards, be sure to run the clean up cells at the end.


### Technical recap

#### 1. Create the demo environment
Run 0_project_dependencies.ipynb. This will create a CloudFormation demo environment, running in a boto3-enabled environment, where CloudFormation allows you to run Lambda functions, CloudTrail, SageMaker notebook instances, interfaces The S3 bucket is created as follows.


#### 2. Build the Step Function pipeline 
Run 1_build_statemachine.ipynb on the built SageMaker notebook instance.
This will build a pipeline with Step Functions, which is the theme of this workshop. 
Also, set up CloudWatchEvents Rule so that StepFunctions is executed when the file is stored in S3.


#### 3. Pre-process data
On the SageMaker notebook instance, run the 2_preprocess_and_put_dataset.ipynb to download and format the retail data. 
In this case, we will simply estimate the daily sales amount in the United Kingdom. 
We store the formatted data in S3 and make sure that the StepFunctions statemachine is started. 
Wait until the pipeline is completed.


#### 4. Create visualizations
When the pipeline process is complete, confirm that the predictions have been output to S3. 
Run 3_visualization.ipynb to simply visualize your prediction results. 
I hope you've found it easy to build your pipeline. The final step is to clean up the resources.


### 5. Cleanup
Run 4_clean.ipynb on your SageMaker notebook instance to clean up all the resources used. This concludes the workshop.