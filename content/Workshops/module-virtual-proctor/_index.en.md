+++
title = "Virtual Proctor Using Amazon Recognition"
description = "This lab guides you through deploying a Virtual Proctor website that implements computer vision via the Amazon Recognition service. We will also take a deep look at the APIs and Lambda functions that provide the interface to Amazon Rekognition."
date = 2019-11-18T08:23:04+11:00
weight = 30
chapter = false
difficulty = "Intermediate / Advanced"
time = "1hr"
inlists = true
CFTemplate = "https://solution-builders-ap-southeast-2.s3.ap-southeast-2.amazonaws.com/amazon-rekognition-virtual-proctor/latest/template.yaml"
CFTemplateName = "VirtualProctor"
+++

Historically, proctored exams were undertaken in a room with other students, supervised by  one or more proctors, who would ensure that everyone followed the rules.

As online examinations become more prevalent, the role of the proctor is changing. Typically, examinees must enable their computer web-cam and the remote proctor supervises via this web-cam to ensure compliance with the examination conditions.

This presents an opportunity to use computer vision techniques to assist the proctor and scale the number of examinees that a proctor can manage concurrently. 


For example:
- Facial recognition technology can continuously ensure that the person sitting the exam matches the face provided on official identity documents
- Facial recognition can also flag anyone who has previously breached exam rules
- Object detection can examine the scene to ensure illegal objects such as mobile phones are not used
- Object detection can ensure that only one person is present in the scene

This workshop will deploy a solution from the AWS Samples GitHub library and will examine the solution components in detail. The solution builds a serverless web user interface which accesses the local web-cam and continuously sends images from the web-cam to the AWS cloud for inspection. The returned results are summarised to the right of screen

![](/images/virtual-proctor/vp_screenshot.png)
> Sample screenshot from the deloyed virtual proctor solution

### Lab Overview

{{< video "VP-full-720p-redact.mov" >}}

>  **Speakers: Jenny Davies, Solutions Architect for AWS Public Sector Australia and New Zealand** 


### Amazon Rekognition Images
The key machine learning component of this solution is the use of Amazon Rekognition, a managed video/image analysis service offered by AWS.

Amazon Rekognition provides APIs which can identify content in both images and videos, today we will be working with images. Amazon Rekognition Images provides pre-trained machine learning models which can identify thousands of different types of objects in a scene, can identify text in a scene, perform facial recognition and more. 

To find out more about the capabilities of Amazon Rekognition, check out the product page: https://aws.amazon.com/rekognition

We will use the Amazon Rekognition Image APIs to regularly examine the scene from the web-cam and look for the following:
-   Objects of interest (Mobile Phone)
-   Number of people detected in the scene
-   Number of faces detected in the scene
-   Facial recognition against a catalogue of registered faces
-   Any unsafe content in the scene (such as explicit or suggestive adult content, violent content or weapons)


### Workshop scope
The scope of this workshop is to:
*   Understand the architecture of the solutions
*   Deploy the solution in your account using a CloudFormation template
*   Dive deep into several key components of the solution such as the API definitions and the Lambda functions which make the calls to Rekognition
*   Build and test your own API definition to call an existing Lambda function


### Lab Steps
{{% children depth="2" %}}


Click [here](./architecture/) to get started!
