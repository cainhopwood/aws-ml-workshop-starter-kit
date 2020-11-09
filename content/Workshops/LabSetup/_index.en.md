+++
title = "Lab Setup"
description = "Use this page to setup your EventEngine account so you have a temporary AWS account in which to run the labs."
date = 2019-11-18T08:26:11+11:00
weight = 11
chapter = false
inlists = true
hidden = false
difficulty = "Easy"
time = "10 mins"

+++
For the virtual loft, we have provisioned AWS accounts for you to use when working on the labs. 
The system that manages these accounts is called Event Engine. You can also use your own account, but we 
recommend you don't use your corporate AWS account. All the labs can be run in the provided accounts, 
except for the Fraud Detection lab. Follow the instructions below, to get your account ready before starting the labs.

#### Amazon Fraud Detector Not Supported
> Due to account service limitations, Amazon Fraud detector is *not supported* by the AWS event engine. If you would like to run the fraud lab, please log out of the event engine provided account, and login to your AWS personal account or a sandbox AWS account. To create an AWS account, follow these instructions: 
{{< sagemaker-fraud-byoa >}}

{{% notice note %}}
If you are using your own AWS account then you can skip this page and go straight into the labs.
{{% /notice %}}

{{< setupsagemaker >}}