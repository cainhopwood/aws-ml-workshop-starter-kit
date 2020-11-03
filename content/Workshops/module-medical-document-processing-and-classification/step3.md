+++
title = "5. Build, Train and Deploy a classification model using Amazon Sagemaker"
date = 2019-11-18T17:11:28+11:00
weight =10
+++

In the previous step, we have prepared our dataset after sampling and extracting medical records with medical 
speciality of *`Surgery`* or *`Consultation`*. The processed dataset under local folder “data/” (shown below).  
In this module, we will be using this dataset to create a classification model that will look at the transcription 
and categorize them into the following two categories - undergoing *`Consultation`* only or refer to a specialist for *`Sugery`*.

The goal of this lab is to do a **Next step Prediction** which aims at predicting the speciality 
needed for a patient with certain diseases. In practice, the model could be used to analyze a medical 
transcription in real-time and provide a recommended referals to respective specialist. 

The input is the EMR as a raw text file with doctor's notes about the patient, including his/her age, 
compaints described in free way, patient's history and so on. It is unstructured - different sections of oen patient 
anamnesis may abscent in another's.

The value on the solution might be found in helping a doctor to find the optimal solution for diasnostics order. 
Patient can save time and money, and doctor can serve a patient more efficiently on sparing time for unnecessary diagnostics.
Moreover, in difficult cases the algorithm may help a doctor to find a diagnosys faster, which in some cases may be extremely 
valuable, up to saving lives.

Theoretically some regularities found by the algorithm may help medical researchers to find the idea of treating some 
deseases, based on their unobvious interconnections with some symptoms.


### Getting Started
> Prerequisites: You must [complete the previous steps](../step3/) of this lab first.

To get started, open the `healthcare-workshop` folder and open the notebook `3.Model_building_training_and_deployment.ipynb`

![](/images/module-medical-document-processing-and-classification/step3-1.png )

Follow the instructions in the notebook to get started.

#### Resources 
1. [documentations of XGBoost Hyperparameters](https://docs.aws.amazon.com/sagemaker/latest/dg/xgboost_hyperparameters.html)
2. [documentations of Updating
 endpoint in SageMaker](https://sagemaker.readthedocs.io/en/stable/api/inference/predictors.html#sagemaker.predictor.Predictor.update_endpoint)
3. [Andrew Ng's course on HyperParameter Optimization](https://www.coursera.org/learn/deep-neural-network)


### Technical recap
 1. Organize the Dataset for model training
 ![](/images/module-medical-document-processing-and-classification/step3-2.png )
 ![](/images/module-medical-document-processing-and-classification/step3-3.png )
 2. Choose the right algorithm
 ![](/images/module-medical-document-processing-and-classification/step3-4.png )
 3. Set up the Hyperparameters 
 ![](/images/module-medical-document-processing-and-classification/step3-5.png )
 4. Train and build the Model
 ![](/images/module-medical-document-processing-and-classification/step3-6.png )
 5. Deploy the Model
![](/images/module-medical-document-processing-and-classification/step3-7.png )


### *Stuck? Watch this*

{{< video "challenge-2.mov" >}}


### Summary
Congratulations! You have completed all the steps of this lab and have:

1. Learned to train a classification machine learning model with Sagemaker using dataset that you've prepared from medical records.
2. Learned to optimize your model accuracy with Sagemaker's HyperParameter Optimization (HPO)
3. Learned to deploy a machine learning model and run inference