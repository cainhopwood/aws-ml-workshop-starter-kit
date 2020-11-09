+++
title = "Dialing In the Right Outcomes with ML + Business Rules in Amazon Fraud Detector"
description = "Create and deploy a fraud detector API using by training a machine learning model and creating business rules with Amazon Fraud Detector. Also learn how to call the fraud detector API, evaluate results and adjust the business rule thresholds to achieve the desired detection rate."
date = 2020-09-23T00:00:00+00:00
weight = 38
chapter = false
difficulty = "Intermediate / Advanced"
CFTemplate = "apj_aiml_loft_workshop.yml"
CFTemplateName = "SagemakerNotebooks"
time = "2 hours (including 45 minute model training time)"
inlists = true
+++

Globally each year, organizations lose tens of billions of dollars to online fraud. Amazon Fraud Detector is a fully managed service that makes it easy to identify potentially fraudulent online activities such as the creation of fake accounts or online payment fraud. Unlike general purpose machine learning solutions, Fraud Detector is designed specifically to detect fraud. Fraud Detector combines customer data with the latest in machine learning science and more than 20 years of fraud detection experience from Amazon.com and AWS. 

In the workshop, with watching a video and experimenting with a jupyter notebook, you will learn the process of:

1. Creating and deploying a detector API using sample data to train a machine learning model and business rules with Amazon Fraud Detector

2. Calling the detector API with test data to evaluating the results.

3. Seeing how adjusting the business rule thresholds can change the test results to suit the desired outcomes of the customer.


{{% notice note %}} 
Due to account service limitations, Amazon Fraud detector is *not supported* by the AWS event engine. 
If you would like to run the fraud lab, please log out of the event engine provided account, and 
login to your AWS personal account or a sandbox AWS account. 
{{% /notice %}}
  
  
### Lab Overview

{{< video "poc-in-a-box-demo.mp4" >}}

>  **Speakers: Mike Ames, Manager, Research Science for Amazon Fraud Detector; Mike Frost - GTM Specialist, Applied AI for Amazon Fraud Detector** 

### Workshop scope

The scope of this workshop is to:

* Understand detailed overview of Amazon Fraud Detector
* Understand how to create fraud detection for new account registration
* Understand how to tune business rules to meet your business requirement.

### Start the lab

Click [here](./step1/) to get started!