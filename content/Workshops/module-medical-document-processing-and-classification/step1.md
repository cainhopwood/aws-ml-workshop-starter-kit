+++
title = "3. Build a Medical Document Processing Pipeline with Amazon Textract and Comprehend Medical"
date = 2019-11-18T17:11:28+11:00
weight =6
+++

In this step, you will learn how to build a data processing pipeline to extract key medical information with electronic health reports 
(EHR) in PDF format by using the following AWS services:

- [Textract](https://aws.amazon.com/textract/): To extract text from medical report in PDF format
- [Comprehend Medical](https://aws.amazon.com/comprehend/medical/): To extract relevant medical information from the output of textract


### Getting started
> Prerequisites: You must [complete setup](../step0/) for this lab first.

If it is your first lab of this workshop, open `Amazon SageMaker`
![](/images/module-medical-document-processing-and-classification/step0-0-sagemaker.png)

Followed with opening `SageMaker Notebook`
![](/images/module-medical-document-processing-and-classification/step0-0-notebook.png)


To get started, find the `healthcare-workshop` folder
![](/images/module-medical-document-processing-and-classification/step0-0-healthcare.png)


Open open the notebook `1.Data_Processing.ipynb`

![](/images/module-medical-document-processing-and-classification/step1-1.png )


#### Select the right kernel
Choose the Kernal to be "conda_python3" as shown below 
![](/images/module-medical-document-processing-and-classification/step1-2.png )


#### Follow the notebook instructions
> To ensure all resources are deleted and they wont keep incurring cost afterwards, be sure to run the clean up cells at the end.


### Technical recap
#### 1. Use Textract to process the dataset with asynchronous API

![](/images/module-medical-document-processing-and-classification/step1-3.png )
![](/images/module-medical-document-processing-and-classification/step1-4.png )


#### 2. Use Comprehend Medical to extract medical terms with *detect_entities_v2* API
![](/images/module-medical-document-processing-and-classification/step1-5.png )


### *Stuck? Watch this*


{{< video "step1-troubleshooting.mov" >}}


### Summary
You have completed Step 1 and have learned how to:
1. Use Amazon textract to extract textual data from a PDF record.
2. Use Amazon Comprehend Medical to extract medical data from textual data.
3. Build a data pipeline that will process a electronic medical record and extract medical data by integrating the Amazon Textract and Comprehend Medical.


### Next steps
In the next step you will learn how to process a batch of medical records to create a 
dataset for the classification machine learning model.

Click [here](../step2/) to read the instructions for the next notebook.
