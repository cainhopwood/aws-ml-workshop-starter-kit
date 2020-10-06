+++
title = "3. Step 2 - Batch Medical Record Processing"
date = 2019-11-18T17:11:28+11:00
weight =8
+++


## Prerequisites
- You must complete Step 1 of this lab first


## Overview

In the previous step, we learnt how to extract medical information from a single PDF medical report using Textract and Comprehend Medical. In this step, we will be preparing our dataset for the classification machine learning model that we will be building. We will use the same pre-processing methodology from the previous step to process a batch of medical reports. But to minimise processing time and cost for this lab, we will skipping the Textract step and focusing on be processing a batch of medical reports in textual format using Comprehend Medical. We will then use the output from Comprehend Medical as our dataset to train our machine learning model.

## Getting Started

To get started, open the `healthcare-workshop` folder and open the notebook `2.Batch_Data_Processing.ipynb`


![](/images/module-medical-document-processing-and-classification/step2-1.png )

Follow the instructions in the notebook to get started.


## Technical Recap

1. Load the dataset
2. Explore and visualize it 
3. Data cleaning 
4. Feature Engineering  

## Summary
You have completed Step 2 and have learned how to:

1. Load a dataset in textual format and batch process it with Amazon Comprehend Medical
2. Explore the output of Amazon Comprehend Medical
3. Create a dataset to train a classification model

In the next step you will learn how to train and deploy a classification machine learning model with Amazon Sagemaker.

---

### *Stuck? Watch this*

{{% notice note %}} 
*This video has no audio*{{% /notice %}}


{{< video "cain-test.mp4" >}}
