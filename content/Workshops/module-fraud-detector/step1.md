+++
title = "Instructions"
date = 2019-11-18T17:11:28+11:00
weight =6
+++

In this workshop, we provide a video to explain how the Amazon Fraud Detector service works, especially how to tune business rules + ML models to meet your business needs. In addition, we also provide a [Jupyter notebook](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/account_registration_fraud_detector.ipynb) to guide you through the experimental process.

For [Jupyter notebook](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/account_registration_fraud_detector.ipynb) detail:

* Experiment process:
  * Prepare and map data-sets to Amazon Fraud Detector.
  * Train Models, Author Rules and Deploy Detectors using the Fraud Detector Console.
  * Interpret model performance metrics. (***this is covered in the video***)
  * Define strategies to get the most out of Fraud Detector Models & Rules
  * Call the Detector’s GetEventPrediction method from a Python Jupyter Notebook  

##### Training data
We will use a prepared sythetic data set as training data -
[project_1_newaccounts_100k.csv](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/project_1_newaccounts_100k.csv) 
and a subset of the validation data - [project_1_newaccounts_5k.csv](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/project_1_newaccounts_5k.csv), 
e.g. first 100 records for demo purpose.


## Lab steps

### 1. Login in to AWS
{{% notice note %}} 
Due to account service limitations, Amazon Fraud detector is *not supported* by the AWS event engine. 
If you would like to run the fraud lab, please log out of the event engine provided account, and 
login to your AWS personal account or a sandbox AWS account. 
{{% /notice %}}

#### Estimated cost of running the workshop
If the workshop is being done on a new AWS account or an account without using Amazon 
SageMaker & Amazon Fraud Detector before, the two month free tier offering should be able to cover the cost. 
For more detail about free tier / free trial: [Amazon SageMaker](https://aws.amazon.com/sagemaker/pricing/) & 
[Amazon Fraud Detector](https://aws.amazon.com/fraud-detector/pricing/). 
Otherwise, you may need to pay fees with on-demand usage and below is the estimation.

* Estimated Cost: ***$32 USD***, assuming:
  * The workshop takes approx. 1.5 hours.
  * 25MB data file is stored in S3 bucket tempoarily (with which the cost can be ignored).
  * Only one model version is created with train data set - [project_1_newaccounts_100k.csv](./project_1_newaccounts_100k.csv), which takes approx. 1hr. And the model hosting time is approx. 1 hours.
  * Approx 1,000 times of fraud predictions will be invoked.
  * 1 hours usage of t3.medium of Amazon SageMake Notebook instance in Sydney Region ($0.0739 USD per hour)
  
To setup an AWS account for the lab, follow these instructions:
{{< sagemakerbyoa >}}


### 2. Go to SageMaker
{{< gotosagemaker >}}


### 3. Open the notebook
Open the 'fraud-workshop' folder and double click on the account_registration_fraud_detector.ipynb notebook.

![](/images/module-fraud-detector/fraud_detector_jupyter_notebook.png)


### 4. Select the right kernel
Be sure to use the 'conda_python3' kernel, which is the default one.


### 5. Start the lab
Run through all the notebook cells to ensure delete resources at the end so that resources won't cost you more after the workshop.

You can now follow the instructions in the notebook to keep going!
