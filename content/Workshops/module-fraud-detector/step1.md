+++
title = "Instructions"
date = 2019-11-18T17:11:28+11:00
weight =6
+++


## Overview

In this workshop, we provide a video to explain how Amazon Fraud Detector service work, especially, how to to tune business rules + ML model to meet your business needs. In addition, we also provide a [Jupyter notebook](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/account_registration_fraud_detector.ipynb) to guide you experiment the process.

For [Jupyter notebook](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/account_registration_fraud_detector.ipynb) detail:

* We will use a prepared sythetic data set as training data - [project_1_newaccounts_100k.csv](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/project_1_newaccounts_100k.csv) and a subset of the validation data - [project_1_newaccounts_5k.csv](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/project_1_newaccounts_5k.csv), e.g. first 100 records for demo purpose.
* Experiment process:
  * Prepare and map data-sets to Amazon Fraud Detector.
  * Train Models, Author Rules and Deploy Detectors using the Fraud Detector Console.
  * Interpret model performance metrics. (***this is covered in the video)
  * Define strategies to get the most out of Fraud Detector Models & Rules
  * Call the Detector’s GetEventPrediction method from a Python Jupyter Notebook  

### 1. Running the notebook

1. Open the 'fraud-workshop' folder and double click on the account_registration_fraud_detector.ipynb notebook.

![](/images/module-fraud-detector/fraud_detector_jupyter_notebook.png)
> Open the notebook

2. Ensure using 'conda_python3' kernel.

You can now follow the instructions in the notebook to keep going!
