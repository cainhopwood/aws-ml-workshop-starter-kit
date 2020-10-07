+++
title = "2. Step 1 - Build a Medical Document Processing Pipeline with Amazon Textract and Comprehend Medical"
date = 2019-11-18T17:11:28+11:00
weight =6
+++


## Overview

In this step, you will learn how to build a data processing pipeline with electronic health reports (EHR) in PDF format to extract key medical information by using the following AWS services:

- [Textract](https://aws.amazon.com/textract/): To extract text from medical report in PDF format
- [Comprehend Medical](https://aws.amazon.com/comprehend/medical/): To extract relevant medical information from the output of textract

## Getting Started

To get started, open the `healthcare-workshop` folder and open the notebook `1.Data_Processing.ipynb`


![](/images/module-medical-document-processing-and-classification/step1-1.png )


Choose the Kernal to be "conda_python3" as shown below 
![](/images/module-medical-document-processing-and-classification/step1-2.png )

Follow the instructions in the notebook to get started.

## Technical dive deep


## Summary
You have completed Step 1 and have learned how to:
1. Use Amazon textract to extract textual data from a PDF record.
2. Use Amazon Comprehend Medical to extract medical data from textual data.
3. Build a data pipeline that will process a electronic medical record and extract medical data by integrating the Amazon Textract and Comprehend Medical.

## Technical Recap

##### 1. use Textract to process the dataset with asynchronous API

![](/images/module-medical-document-processing-and-classification/step1-3.png )
![](/images/module-medical-document-processing-and-classification/step1-4.png )

##### 2. Use Comprehend Medical to extract medical terms with *detect_entities_v2* API
![](/images/module-medical-document-processing-and-classification/step1-5.png )



In the next step you will learn how to process a batch of medical records to create a dataset for the classification machine learning model.

---

### *Stuck? Watch this*

{{% notice note %}} 
*This video has no audio*{{% /notice %}}


{{< video "cain-test.mp4" >}}
