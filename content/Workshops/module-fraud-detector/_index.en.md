+++
title = "Lab 3: Dialing In the Right Outcomes with ML + Business Rules in Amazon Fraud Detector"
description = "This workshop consists of watching a video and a Jupyter notebook to guide you in the process of 1) creating and deplying a detector API using sample data to train a machine learning model and business rules with Amazon Fraud Detector 2) calling the detector API with test data to evaluating the results and 3) seeing how adjusting the business rule thresholds can change the test results to suit the desired outcomes of the customer."
date = 2020-09-23T00:00:00+00:00
weight = 38
chapter = false
difficulty = "Intermediate / Advanced"
CFTemplate = "apj_aiml_loft_workshop.yml"
CFTemplateName = "SagemakerNotebooks"
time = "Approximately 1.5 hr (not counting 30-45 min time for training a model)"
inlists = true
+++

Globally each year, organizations lose tens of billions of dollars to online fraud. Amazon Fraud Detector is a fully managed service that makes it easy to identify potentially fraudulent online activities such as the creation of fake accounts or online payment fraud. Unlike general purpose machine learning solutions, Fraud Detector is designed specifically to detect fraud. Fraud Detector combines customer data with the latest in machine learning science and more than 20 years of fraud detection experience from Amazon.com and AWS. 

In the workshop, with watching a video and experimenting a [Jupyter notebook](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/account_registration_fraud_detector.ipynb), you will learn the process of:

1. Creating and deploying a detector API using sample data to train a machine learning model and business rules with Amazon Fraud Detector

2. Calling the detector API with test data to evaluating the results.

3. Seeing how adjusting the business rule thresholds can change the test results to suit the desired outcomes of the customer.

### Lab Overview

{{< video "poc-in-a-box-demo.mp4" >}}

>  **Speakers: Mike Ames, Manager, Research Science for Amazon Fraud Detector; Mike Frost - GTM Specialist, Applied AI for Amazon Fraud Detector** 

### Lab Model Training Data

We will use a prepared sythetic data set as training data - [project_1_newaccounts_100k.csv](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/project_1_newaccounts_100k.csv) and a subset of the validation data - [project_1_newaccounts_5k.csv](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/project_1_newaccounts_5k.csv), e.g. first 100 records for demo purpose.

### Workshop scope

The scope of this workshop is to:

* Understand detailed overview of Amazon Fraud Detector
* Understand how to create fraud detection for new account registration
* Understand how to tune business rules to meet your business requirement.

{{< sagemakereventengine >}}

### Lab Steps
{{% children depth="2" %}}

Click [here](./step1/) to get started!

### Lab Jupyter Notebook
[Jupyter notebook](https://github.com/tom5610/amazon-fraud-detector-workshop/blob/master/account_registration_fraud_detector.ipynb) covers concepts and ideas introduced in the video. And the related GitHub project [Amazon Fraud Detector Workshop](https://github.com/tom5610/amazon-fraud-detector-workshop) - is based on [Mike Ames GitHub Project](https://github.com/mikames/data-and-notebooks).