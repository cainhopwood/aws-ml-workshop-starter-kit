+++
title = "4. Process multiple medical notes in a batch"
date = 2019-11-18T17:11:28+11:00
weight =8
+++

In the previous step, we learnt how to extract medical information from a single PDF medical report using 
Textract and Comprehend Medical. In this step, we will be preparing our dataset for the classification machine 
learning model that we will be building. We will use the same pre-processing methodology from the previous step to
process a batch of medical reports. But to minimise processing time and cost for this lab, we will skipping the Textract 
step and focusing on be processing a batch of medical reports in textual format using Comprehend Medical. We will then use 
the output from Comprehend Medical as our dataset to train our machine learning model.

> Prerequisites: You must [complete step 3](../step1/) of this lab first.

### Getting started
To get started, open the `healthcare-workshop` folder and open the notebook `2.Batch_Data_Processing.ipynb`

![](/images/module-medical-document-processing-and-classification/step2-1.png )

Follow the instructions in the notebook to get started.
> To ensure all resources are deleted and they wont keep incurring cost afterwards, be sure to run the clean up cells at the end.





### Technical recap

#### 1. Load the dataset
![](/images/module-medical-document-processing-and-classification/step2-2.png )

#### 2. Data cleaning 
![](/images/module-medical-document-processing-and-classification/step2-3.png )

#### 3. Explore and visualize it 

![](/images/module-medical-document-processing-and-classification/step2-4.png )

#### 4. Feature engineering  
![](/images/module-medical-document-processing-and-classification/step2-5.png )

#### 5. Save the dataset in *csv* format


### *Stuck? Watch this*


{{< video "challenge-1.mov" >}}

### Solution for Challenge-1
1. Define a function to extract all the medical condition

    You can refer to the function `extractMC_v2` defined in util/preprocess.py

        import inspect
        print(inspect.getsource(extractMC_v2))


2. add a unique patient id to each patient, and append it to the patients list
        
        df_ind=extractMC_v2(item) ## extract mc
        df_ind['ID']=patient_id ## add patient id
        df_final=df_final.append(df_ind) ## append it




### Summary
You have completed Step 2 and have learned how to:

1. Load a dataset in textual format and batch process it with Amazon Comprehend Medical
2. Explore the output of Amazon Comprehend Medical
3. Create a dataset to train a classification model


### Next steps
In the next step you will learn how to train and deploy a classification machine learning model with Amazon Sagemaker.

Click [here](../step3/) to read the instructions for the notebook.