+++
title = "6. Build Your Own API"
date = 2019-11-18T17:11:28+11:00
weight =5
+++

## Build and test our own API
> Note: The instructions on this page walk through testing the API you build here using the Postman app on your machine. 
> You can download this app from here: {{< ext-link "https://www.postman.com/downloads/" >}}

> If you are comfortable using another API testing tool such as curl, feel free to do so

In this section we will create our own API (but this time without authentication) to interact with one of the Lambda functions. By not adding authentication, we will easily be able to test our API using the Postman tool

### Build an API
So that we gain the experience, let's set up a method of our own within the existing API definition.

1.	Select the root path of the API
{{< figure src="/images/virtual-proctor/build_your_own_api/api_definition_root.png" class="img-left" >}}

2.	Select `Actions` -> `Create Resource`
{{< figure src="/images/virtual-proctor/build_your_own_api/api_create_resource.png" class="img-left" >}}

3.	For the `Resource Name`, type `sample`
{{< figure src="/images/virtual-proctor/build_your_own_api/new_child_resource.png" class="img-left" >}}
Click `Create Resource`

4.	Select the new resource path `/sample`
{{< figure src="/images/virtual-proctor/build_your_own_api/resource_path_sample.png" class="img-left" >}}

5.	Select `Action` -> `Create Method`
{{< figure src="/images/virtual-proctor/build_your_own_api/api_create_method.png" class="img-left" >}}

6.	From the drop-down options, select `POST`
{{< figure src="/images/virtual-proctor/build_your_own_api/method_post.png" class="img-left" >}}

7.	Click the tick box to the right of `POST`
{{< figure src="/images/virtual-proctor/build_your_own_api/method_post_tick.png" class="img-left" >}}
If you get a message regarding “Invalid model identifier specified: Empty”; just close it

8. You will now be at the setup screen for the integration point for your API. Configure as follows:
- Leave the Integration type set to `Lambda Function`. 
- Select the checkbox to the right of `Use Lambda Proxy integration`. 
- In the Lambda Function selection box, type the letter `v` and then select the function starting with `VirtualProctor-ProcessImageFunction`
{{< figure src="/images/virtual-proctor/build_your_own_api/select_lambda_function.png" class="img-left" >}}

9. Your setup should now look like this (although your Lambda function will have a different unique suffix):
{{< figure src="/images/virtual-proctor/build_your_own_api/setup_integration.png" class="img-left" >}}
Click `Save`

10.	Select “Actions -> Deploy API”
{{< figure src="/images/virtual-proctor/build_your_own_api/deploy_api.png" class="img-left" >}}

11.	Select `Prod` for the Deployment Stage and click `Deploy`

12.	That’s it, we’ve just created a public API method to call our Lambda function to process images. The difference from this method to the existing method is that our new method does not have an authorizer so it can be called by anyone.
Take note of the Invoke URL for your API at the top of the screen; something like:
{{< figure src="/images/virtual-proctor/build_your_own_api/invoke_url.png" class="img-left" >}}

### Test the API
So that we gain the experience, let's set up a method of our own within the existing API definition.

1.	Make sure you have an image saved on your laptop/PC that has a picture of you holding a mobile phone (or other item of interest)

2.	Use a tool to Base64 encode your image. Here is one such tool on the internet: {{< ext-link "https://base64.guru/converter/encode/image" >}}

> Note: If you use this tool; select Output Format “Plain text -- just the Base64 value”)

> Select your local file; encode; and copy the Base64 output to your clipboard

3.	Open the Postman tool and create a `POST` request to your API URL with `/sample` appended. E.G:
{{< figure src="/images/virtual-proctor/build_your_own_api/postman_request.png" class="img-left" >}}

4.	In the Body of your API request select `raw` and enter the following text in the body entry:
{{< highlight yaml >}}
{ “image” : “<paste your Base64 value here>” }
{{< / highlight >}}

> Note: Replace the text `<paste your Base64 value here>` with your Base64 encoded image text

5.	Click `Send`
{{< figure src="/images/virtual-proctor/build_your_own_api/postman_send_button.png" class="img-left" >}}

6.	Your response should look something like the following:
{{< figure src="/images/virtual-proctor/build_your_own_api/postman_response.png" class="img-left" >}}

7.  When you have finished testing your API method, you can delete it by selecting the `/sample` resource and selecting `Delete Resource` from the `Actions` menu
{{< figure src="/images/virtual-proctor/build_your_own_api/api_delete_resource.png" class="img-left" >}}

### Summary
Congratulations, not only have you used the Virtual Proctor solution; now you have also deployed your own API method to interact with one of the backend Lambda functions.

Once you've finished, we will delete the resources that the CloudFormation template created

Click [here](../cleanup/) to get started!