+++
title = "4. Technical Deep Dive"
date = 2019-11-18T17:11:28+11:00
weight =5
+++


## Technical Deep Dive
From an architectural perspective, the key aspect to understand about this solution is that we have Lambda functions driving the interaction with Amazon Rekognition.These Lambda functions are exposed to the internet behind APIs powered by Amazon API Gateway.

This architecture allows the website running in the user’s browser to make calls to the API.
> Note: API security is provided using Amazon Cognito; however, the details of this are beyond the scope of this workshop.

### Lambda Functions
Where does CloudFormation download the Lambda function code from?

For those familiar with CloudFormation, you can look at the template by opening the “Template” tab in the CloudFormation console.
{{< figure src="/images/virtual-proctor/tech_deep_dive/cloudformation_template.png" class="img-left" >}}
Approximately three-quarters of the way through the template you can find the resource definitions for two Lambda functions:
-  IndexFaceFunction
-  ProcessImageFunction

{{< highlight yaml "hl_lines=1-5 19-23" >}}
  IndexFaceFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: index.indexHandler
      CodeUri: s3://solution-builders-ap-southeast-2/amazon-rekognition-virtual-proctor/v0.9/fd120cdc4339f4680e29c3ae3144d6fe
      Events:
        Get:
          Type: Api
          Properties:
            Path: /faces/index
            Method: post
      Policies:
      - DynamoDBWritePolicy:
          TableName:
            Ref: FacesTable
      - RekognitionWriteOnlyAccessPolicy:
          CollectionId:
            Ref: ResourcePrefix
  ProcessImageFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: index.processHandler
      CodeUri: s3://solution-builders-ap-southeast-2/amazon-rekognition-virtual-proctor/v0.9/fd120cdc4339f4680e29c3ae3144d6fe
      Events:
        Get:
          Type: Api
          Properties:
            Path: /process
            Method: post
      Policies:
      - DynamoDBReadPolicy:
          TableName:
            Ref: FacesTable
      - RekognitionReadPolicy:
          CollectionId:
            Ref: ResourcePrefix
      - RekognitionDetectOnlyPolicy: {}
{{< / highlight >}}
Notice that both of the Lambda functions download their code from the same CodeUri which is hosted in an AWS Solutions Builder bucket. Importantly, each function has a different entry point (Handler) to the same code. We will look at this in more detail later.

#### Accessing the Lambda code
To have a closer look at this Lambda code, we can either create some credentials and use the AWS CLI to download this code package, or we can just look at the source code in the GitHub repository.

##### Option 1 (for those experienced with IAM and the AWS CLI)
> Pre-requisite: AWS CLI installed on your local computer and configured with valid IAM access keys.
If you don't know how to do this, use Option 2

On your local computer, use the AWS CLI to download the software package from the CodeUri you found. 
eg. to download the software package in the `ap-southeast-2` region, you would use the following commands:

{{< highlight bash >}}
aws s3 cp s3://solution-builders-ap-southeast-2/amazon-rekognition-virtual-proctor/v0.9/fd120cdc4339f4680e29c3ae3144d6fe .

unzip fd120cdc4339f4680e29c3ae3144d6fe
{{< / highlight >}}

Now you can open `index.js` in your favourite code editor.

##### Option 2 (view the source code in the GitHub repository)
Enter the following URL in a new browser tab:

https://github.com/aws-samples/amazon-rekognition-virtual-proctor/blob/master/src/functions/proctor/index.js

#### Understanding the Lambda code
Note: All Lambda code discussed in this workshop is written in the node.js language and is executed inside the Node.js 12.x runtime. You may use a different language and runtime environment for your own project. 
> Note: The full list of available runtimes can be found at the following link: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html

##### indexHandler Entry point
This entry point handles adding a new face to the Rekognition collection and then storing the unique ID and associated name for that face in a DynamoDB table

Find the function in the Lambda code that starts with the line:
{{< highlight javascript >}}
exports.indexHandler = async (event) => {
{{< / highlight >}}


You don’t need to be an expert at node.js at this point, rather just read the function to get an idea of the following key concepts:
1.	`ExternalImageId` is a unique identifier that will be used to index the face into the Rekognition collectionand to reference the name associated with the face in the DynamoDB table.
2.	`indexFaces` is a function definition that calls the Rekognition `indexFaces` method to index the face into the collection with the unique identifier.
3.	`persistMetadata` is a function definition that writes an item to the DynamoDB table. The item has three attributes: `CollectionId`, `ExternalImageId` and `FullName`

##### processHandler Entry point
This entry point handles all the calls to Rekognition to analyse the image to detect  known  faces, unsafe content, known (indexed) faces and the corresponding names in our DynamoDB table.

Find the function in the Lambda code that starts with the line:
{{< highlight javascript >}}
exports.processHandler = async (event) => {
{{< / highlight >}}

You don’t need to be an expert at node.js at this point, rather just read the function to get an idea of the following key concepts:
1.	`imageBytes` is a binary buffer which holds the scene image.
2.	Four function calls are made to perform the various image examination activities.`processHandler` waits for all four function calls to return before joining (flattening) the results and returning them.
3.	`fetchLabels`: find the function in the Lambda code that starts with the line:
{{< highlight javascript >}}
const fetchLabels = async (imageBytes) => {
{{< / highlight >}}
    The key operations performed by this function are:
    -	`detectLabels` is a function that calls the Rekognition `detectLabels` method to return all labels for the scene that have a confidence score above the threshold.
    -	Makes a call to `detectLabels` and save the results (a JSON string) as `labels`
    -	Finds all instances within `labels` where `Name` equals `Person`. Sets a success flag if exactly one person is detected.
    -	Filters ‘labels’ to find any labels that match any of our objects of interest (e.g. mobile phone). Sets a success flag if no objects of interest are found. If any objects of interest are found, places them in a comma separated list and returns them.

4.	`searchForIndexedFaces`: find the function in the Lambda code that starts with the line:
{{< highlight javascript >}}
const searchForIndexedFaces = async (imageBytes) => {
{{< / highlight >}}
    The key operations performed by this function are:
    -	`searchFace` is a function definition that calls the Rekognition `searchFacesByImage` method to find the largest face in the image and return details of any match to faces already indexed in the collection.
    -	`getFaceByExternalImageId` is a function definition that takes an ImageId (i.e. the ID of a face match in the Rekognition collection) and finds the associated name for that face match stored in the DynamoDB table.
    -	Use the above functions to see if the scene has a face in it, and that face has a match in our Rekognition collection. Set a success flag if we have a match. If we have a name match, return the name.

5.	`fetchFaces`: find the function in the Lambda code that starts with the line:
{{< highlight javascript >}}
const fetchFaces = async (imageBytes) => {
{{< / highlight >}}
    The key operations performed by this function are:
    -	`detectFaces` is a function definition that calls the Rekognition `detectFaces` method to find all faces in the image.
    -	Sets a success flag if exactly one face is detected.

6.	`fetchModerationLabels`: find the function in the Lambda code that starts with the line:
{{< highlight javascript >}}
const fetchModerationLabels = async (imageBytes) => {
{{< / highlight >}}
    The key operations performed by this function are:
    -	`detectModerationLabels` is a function definition that calls the Rekognition `detectModerationLabels` method to report any potentially unsafe content in the scene that has a confidence score above the threshold.
    -	Use the above function to find any labels that indicate unsafe content. Set a success flag if no such labels are found. If any such labels are found, place them in a comma separated list and return them.


### API Gateway Definitions
The Lambda functions are exposed as APIs using the Amazon API Gateway service. Let’s have a look at these definitions to see how this is done.

1.	In the AWS console, select the `Services` drop-down tab and type the first few letters of `API Gateway` in the search box.
{{< figure src="/images/virtual-proctor/tech_deep_dive/console_api_gateway.png" class="img-left" >}}
Click on `API Gateway`

2.	You should see a single REST API named `VirtualProctor`.
{{< figure src="/images/virtual-proctor/tech_deep_dive/api_virtual_proctor.png" class="img-left" >}}
Click on the name `Virtual Proctor`.

3.	In the left-hand column select `Authorizers`.
{{< figure src="/images/virtual-proctor/tech_deep_dive/select_authorizers.png" class="img-left" >}}

4.	Take note of the Authorizer called `Cognito Authorizer`. Remember when you logged on to the Virtual Proctor website? You were authenticating to a Cognito User Pool to get an access token. The Authorizer we are currently looking at is going to be attached to our API and it will check for this access token in the headers of any requests to our API.
{{< figure src="/images/virtual-proctor/tech_deep_dive/api_cognito_authorizer.png" class="img-left" >}}
This is how we are securing access to our API.

5.	In the left-hand column select `Resources`.
{{< figure src="/images/virtual-proctor/tech_deep_dive/select_resources.png" class="img-left" >}}

6.	Have a look at the resources defined within our API.
{{< figure src="/images/virtual-proctor/tech_deep_dive/api_resources.png" class="img-left" >}}

7.	The API defines two resources:
-	An HTTP POST method is defined under the `/faces/index` path.
-	An HTTP POST method is defined under the `/process` path.

8.	Click on the `POST` method under the `/process` path.
{{< figure src="/images/virtual-proctor/tech_deep_dive/select_process_post_method.png" class="img-left" >}}

9.	Now we can see the full API definition for this method
{{< figure src="/images/virtual-proctor/tech_deep_dive/process_api_definition.png" class="img-left" >}}
Click on `Method Request`

10.	We can see that our API method uses the `CognitoAuthorizer` that we previously looked at to ensure calls to this API come from authenticated sources
{{< figure src="/images/virtual-proctor/tech_deep_dive/api_security_settings.png" class="img-left" >}}

11.	Return to the `Method Execution` view
{{< figure src="/images/virtual-proctor/tech_deep_dive/return_method_execution.png" class="img-left" >}}

12.	Click on `Integration Request`
{{< figure src="/images/virtual-proctor/tech_deep_dive/api_integration_request.png" class="img-left" >}}
Our API uses Lambda Proxy integration which essentially just passes the full HTTP request to the backend Lambda function and requires the Lambda function to handle returning the correct HTTP response code



### Summary
We've looked at the Lambda functions which drive the API calls to Amazon Rekognition; and we've also looked at the API Gateway definitions which expose external REST APIs that our website can call

Now move on to defining our own API (this time without an authenticator) that we can call using the Postan tool (or any other API test tool)

Click [here](../build_your_own_api/) to get started!

