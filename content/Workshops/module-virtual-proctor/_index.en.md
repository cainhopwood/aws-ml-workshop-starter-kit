+++
title = "Lab 1: Virtual Proctor Using Amazon Recognition"
description = "This lab guides you through deploying a Virtual Proctor website using Amazon Recognition. We will also take a deep look at the APIs and Lambda functions that provide the interface to Amazon Rekognition."
date = 2019-11-18T08:23:04+11:00
weight = 30
chapter = false
difficulty = "Intermediate / Advanced"
time = "1hr"
inlists = true
+++

Historically, proctored exams were done in a room with other students under the supervision of one or more proctors. The role of the proctors is to ensure that everyone follows the rules, and no one is cheating.

As we move to more examinations being performed online; the role of the proctor is changing. Typically, examinees must enable their computer web-cam and the remote proctor is responsible for watching examinees via this web-cam to ensure compliance with the examination conditions.

This presents an opportunity to use computer vision techniques to assist the proctor and scale the number of examinees that a proctor can manage at time. 

For example:
- Facial recognition technology can continuously ensure that the person sitting the exam matches the face provided on official identity documents
- Facial recognition can also look out for known cheaters
- Object detection can examine the scene to ensure illegal objects such as mobile phones are not used
- Object detection can ensure that only one person is present in the scene

This workshop will deploy a sample solution from the AWS samples GitHub library and will examine the solution components in detail. The solution builds a serverless web user interface which accesses the local web-cam and continuously sends images from the web-cam to the AWS cloud for inspection. The returned results are summarised to the right of screen


### Lab Overview

{{< rawhtml >}}
<video width="696" height="392" controls>
  <source src="https://d1tqhetmq9f85b.cloudfront.net/downloads/apacsecweek-lab4.mp4" type="video/mp4">
  Your browser doesn't support video.
</video>
{{< /rawhtml >}}

>  **Speakers: Jenny Davies (AWS)** 

>  *Video Notes (if any)*

### Amazon Rekognition Images
The key machine learning component of this solution is the use of Amazon Rekognition, a managed video/image analysis service offered by AWS.

Amazon Rekognition provides two sets of APIs, one for images and one for videos. Amazon Rekognition Images provides pre-trained machine learning models which can identify thousands of different types of objects in a scene, can identify text in a scene, perform facial recognition and more. 

To find out more about the capabilities of Amazon Rekognition, check out the product page: https://aws.amazon.com/rekognition

We will use the Amazon Rekognition Image APIs to regularly examine the scene from the web-cam and look for the following:
- Objects of interest (Mobile Phone)
- Number of people detected in the scene
- Number of faces detected in the scene
- Facial recognition against a catalogue of registered faces
- Any unsafe content in the scene


### Workshop scope
The scope of this workshop is to:
- Understand the architecture of the solutions
- Deploy the solution in your account using a CloudFormation template
- Dive deep into several key components of the solution such as the API definitions and the Lambda function which makes the calls to Rekognition
- Build and test your own API definition to call an existing Lambda function


### Lab Steps
{{% children depth=2 %}}


Click [here](./architecture/) to get started!
