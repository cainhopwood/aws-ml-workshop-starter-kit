+++
title = "2. Solution Deployment"
date = 2019-11-18T17:11:28+11:00
weight =5
+++

## Solution Deployment

This solution is deployed through a QuickLink provided in the GitHub repository.The QuickLink launches a CloudFormation stack in your AWS account. The template will build all the required resources.

> Note: In future you may want to use this repository as the basis of your own website. If this is the case, take a look at the file `CONTRIBUTING.md` where the authors run you through deploying a customised version of the Web UI.

### Deploy the solution to your account
1.	Log into your AWS account on the console
2.	In another browser tab, navigate to:
https://github.com/aws-samples/amazon-rekognition-virtual-proctor
3.	Select the QuickLink for your closest AWS region
{{< figure src="/images/virtual-proctor/solution_deployment/quicklink_regions.png" class="img-left" >}}

4.	The Create stack screen will open in your AWS console
{{< figure src="/images/virtual-proctor/solution_deployment/create_stack.png" class="img-left" >}}
Click `Next`

5.	The Specify stack details screen will open with the following parameter options:

-	`AdminEmail` - Enter an email address you have access to today. This email address will be your username to authenticate to the virtual proctor site. A temporary password will be sent to this email address.
-	`CreateCloudFrontDistribution` - Leave at the default value of true.
-	` MinConfidence` - If this is your first time through the workshop, leave this at its default setting of 85 - reducing this value will result in a lower confidence threshold being set for Amazon Rekognition. Note that it is possible to modify this value later in the workshop.
-	`ObjectsOfInterestLabels` - Do not delete the default labels; however, you can add additional objects to the parameter using comma separation. For example if you have a drink with you, try adding appending the labels “Drink,Glass,Cup” to this field. Note that it is possible to modify this field later in the workshop.
-	`ResourcePrefix` - If you are sharing your account with someone else,ensure you both set a different value for this prefix.
{{< figure src="/images/virtual-proctor/solution_deployment/stack_parameters.png" class="img-left" >}}
Click `Next`

6.	At the Configure stack options page keep all the defaults
{{< figure src="/images/virtual-proctor/solution_deployment/stack_options.png" class="img-left" >}}
Click `Next`

7.	At the Review page, scroll all the way to the bottom.
Tick the three checkboxes to acknowledge that you are granting CloudFormation access to create resources in your AWS account.
{{< figure src="/images/virtual-proctor/solution_deployment/stack_permissions.png" class="img-left" >}}
Click `Create stack`

8.	You can watch the progress of resource creation by periodically clicking the refresh button.
{{< figure src="/images/virtual-proctor/solution_deployment/stack_progress.png" class="img-left" >}}
The stack will take about 5 minutes to deploy

9.	Once the stack creation is complete, open the ‘Outputs’ tab and find the URL for your static website.
{{< figure src="/images/virtual-proctor/solution_deployment/stack_outputs.png" class="img-left" >}}
Open this URL in a new tab

10.	You will be prompted to sign in to your account.
{{< figure src="/images/virtual-proctor/solution_deployment/site_signin.png" class="img-left" >}}

11.	Wait a minute or two to receive your temporary credentials via email.
{{< figure src="/images/virtual-proctor/solution_deployment/email_credentials.png" class="img-left" >}}

12.	Sign in with the temporary credentials
{{< figure src="/images/virtual-proctor/solution_deployment/site_signin_password.png" class="img-left" >}}
Click `SIGN IN`

13.	Set your new password when prompted.

14.	Allow the website to access your web-cam and microphone.
{{< figure src="/images/virtual-proctor/solution_deployment/site_local_access.png" class="img-left" >}}
Click `Allow`

15.	You have now deployed the virtual proctor solution. Move on to the next section to examine the features of the solution

### Summary
We've deployed this solution in your own account from a CloudFormation template.
We've also completed the intial authentication to our site.

Now move on to exercising this solution to see what it can do.

Click [here](../vp_demo/) to get started!