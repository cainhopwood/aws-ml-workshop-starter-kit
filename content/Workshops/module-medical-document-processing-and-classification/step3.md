+++
title = "3. Step 3 - Build, Train and Deploy a classification model using Amazon Sagemaker"
date = 2019-11-18T17:11:28+11:00
weight =10
+++


## Prerequisites
- You must complete Step 2 of this lab first


## Overview

In the previous step, we prepared our dataset by extracting medical records that had a medical speciality of *`Surgery`* and *`Consultation`*. In this module, we will be using this dataset to create a classification model that will look at the transcription and categorize them into the following two categories - undergoing *`Consultation`* only or refer to a specialist for *`Sugery`*.

The goal of this experiment is to do a **Next step Prediction** which aims at predicting the speciality needed for a patient with certain diseases. In practice, the model could be used to analyze a medical transcription in real-time and provide a recommended referals to respective specialist. 

The input is the EMR as a raw text file with doctor's notes about the patient, including his/her age, compaints described in free way, patient's history and so on. It is unstructured - different sections of oen patient anamnesis may abscent in another's.

The value on the solution might be found in helping a doctor to find the optimal solution for diasnostics order. Patient can save time and money, and doctor can serve a patient more efficiently on sparing time for unnecessary diagnostics. Moreover, in difficult cases the algorithm may help a doctor to find a diagnosys faster, which in some cases may be extremely valuable, up to saving lives.

Theoretically some regularities found by the algorithm may help medical researchers to find the idea of treating some deseases, based on their unobvious interconnections with some symptoms.

## Getting Started

To get started, open the `healthcare-workshop` folder and open the notebook `3.Model_building_training_and_deployment.ipynb`


![](/images/module-medical-document-processing-and-classification/step3-1.png )

Follow the instructions in the notebook to get started.

## Summary
You have completed Step 3 and have 

1. Learned how to train a classification machine learning model with Sagemaker using dataset that you've prepared from medical records.
2. Learned how to optimize your model accuracy with Sagemaker's HyperParameter Optimization
3. Learned how to deploy a machine learning model and run inference

---

### *Stuck? Watch this*

{{% notice note %}} 
*This video has no audio*{{% /notice %}}


{{< video "cain-test.mp4" >}}
