+++
title = "Lab 5.3 - Automate sales projections with Amazon Forecast"
date = 2019-11-18T17:11:28+11:00
weight = 30
+++


## Overview

![](https://user-images.githubusercontent.com/27226946/89359520-02cab680-d701-11ea-979c-c1f35cb07292.png)

<br>

In the retail industry, forecasting sales and visitor numbers is an important topic that directly affects your business. Accurate sales forecasting can help you avoid overstocked merchandise and lost sales opportunities. This helps to both reduce costs and increases revenue. Accurately predicting the number of visitors will also enable you to efficiently plan employee shifts and provide better customer service.

In this workshop, we will build a forecasting pipeline with Amazon Forecast using Step Functions.
After building the pipeline, we store the retail data in S3, which automatically performs data import, training, and forecasting for Amazon Forecast and stores the results in S3. The results can be visualized in Amazon QuickSight, but for this workshop, we'll simply graph the results in a notebook.

### Get started

#### To star the lab

![](/images/module-forecasting/lab3_notebooks.png)

1. Run 0_project_dependencies.ipynb. This will create a CloudFormation demo environment, running in a boto3-enabled environment, where CloudFormation allows you to run Lambda functions, CloudTrail, SageMaker notebook instances, interfaces The S3 bucket is created as follows.
2. 1_build_statemachine.ipynb on the built SageMaker notebook instance. Run. This will build a pipeline with Step Functions, which is the theme of this workshop. Also, set up CloudWatchEvents Rule so that StepFunctions is executed when the file is stored in S3.
3. On the SageMaker notebook instance, create 2_preprocess_and_put_dataset.ipynb to download and format the retail data. In this case, we will simply estimate the daily sales amount in the United Kingdom. We store the formatted data in S3 and make sure that the StepFunctions statemachine is started. Wait until the pipeline is completed.
4. When the pipeline process is complete, confirm that the predictions have been output to S3. 3_visualization.ipynb to simply visualize your prediction results. I hope you've found it easy to build your pipeline. The final step is to clean up the mess.
5. Run 4_clean.ipynb on your SageMaker notebook instance to clean up all the resources used. This concludes the workshop.