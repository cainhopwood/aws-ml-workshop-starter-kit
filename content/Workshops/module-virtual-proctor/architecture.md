+++
title = "1. Architecture"
date = 2019-11-18T17:11:28+11:00
weight =5
+++

## Workshop architecture

The backend architecture of this solution is shown below:
![](/images/virtual-proctor/architecture/architecture_diagram.png)

- A static website is hosted on Amazon S3 and distributed using the Amazon CloudFront content delivery network.
- Javascript code runs in the user’s browser to authenticate the user to Cognito and request access to the local web-cam.

The website has a button to “Add a new user” which will call the ‘/faces/index’ API
There is also a button to “Start Virtual Proctor” which initiates the process of regularly grabbing frames from the web-cam and sending them to the ‘process’ API. 

## Workflows
### Register a new face to the collection:
1.	User clicks “Add a new user”.
2.	The website prompts the user to select an image of the new user from their hard-drive.
3.	The website prompts the user to provide a name (fullName) for the new image.
4.	The website calls the API “/faces/index” with the POST method, passing the image and the name.
5.	The AWS API Gateway has LAMBDA_PROXY integration so it sends the data to the IndexFaceFunction Lambda function as-is.
6.	The IndexFaceFunction Lambda function generates a unique reference ID.
7.	The IndexFaceFunction Lambda function calls the Rekognition IndexFaces method to index the face with the unique reference ID and stores it in an existing Rekognition collection.
8.	The IndexFaceFunction Lambda function stores the reference ID and corresponding name (fullName) in the DynamoDB table.
9.	If all processing is successful, the IndexFaceFunction Lambda function returns a HTTP 200 status code.

### Process a new image
1.	The website continually captures new images from the web-cam.
2.	It calls the API “/process” with the POST method, passing only the image.
3.	The AWS API Gateway has LAMBDA_PROXY integration and sends the data to the ProcessImageFunction Lambda function as-is.
4.	The ProcessImageFunction Lambda function calls the Rekognition DetectLabels method to find all labels about the image that have a confidence score of greater than our set threshold (default 85%).
5.	The ProcessImageFunction Lambda function filters the labels to count how many occurrences of “Person” are detected.
6.	The ProcessImageFunction Lambda function filters the labels against the specified objects of interest (e.g. mobile phone) to determine if any such objects are detected.
7.	The ProcessImageFunction Lambda function calls the Rekognition SearchFacesByImage method to check if the largest face in the image matches an indexed face in the Rekognition collection. If a match is found, the corresponding full name for face is looked up in the DynamoDB table.
8.	The ProcessImageFunction Lambda function calls the Rekognition DetectFaces method to check that there is one face, and only one face in the image
9.	The ProcessImageFunction Lambda function calls the Rekognition DetectModerationLabels method to find all moderation labels (such as explicit adult content or violent content) about the image that have a confidence score of greater than the set threshold (default 85%).
10.	If all processing is successful, the Lambda function returns a HTTP 200 status code and includes the results as a JSON string in the HTTP body.

### Summary
We've looked at the Architecture for this solution as well as walking through the two workflows that this solution provides for our website to interact with.

Now move on to deploying this solution in the account that you are using today.

Click [here](../setup/) to get started!