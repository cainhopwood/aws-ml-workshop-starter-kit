+++
title = "1. Architecture"
date = 2019-11-18T17:11:28+11:00
weight =5
+++

## Workshop architecture
![](/images/sec-arch.png)
This environment consists of a VPC with two subnets. The subnets contains an Amazon EC2 bastion host running Amazon Linux 2 used for running AWS CLI commands and a private, not publicly-accessible, Amazon RDS MySQL database instance. The subnets are chosen based on the availability of an interface VPC endpoint for AWS Secrets Manager. The VPC also contains an AWS Fargate container running the Amazon Linux 2 operating system. In the RDS and Fargate phases of the workshop, you will learn how to use AWS Secrets Manager to access the RDS database from both a standard EC2 instance and the Fargate container.

## Environment Setup

{{%expand "Click here if you're not at an AWS event or are using your own account" %}}

In order to complete these workshops, you'll need a valid, usable [AWS Account](https://aws.amazon.com/getting-started/). Use a personal account or create a new AWS account to ensure you have the necessary access and that you do not accidentally modify corporate resources. Do **not** use an AWS account from the company you work for. **We strongly recommend that you use a non-production AWS account for this workshop such as a training, sandbox or personal account. If multiple participants are sharing a single account you should use unique names for the stack set and resources created in the console.**

**Create an admin user**

If you don't already have an AWS IAM user with admin permissions, please use the following instructions to create one:

1. Browse to the [AWS IAM](https://console.aws.amazon.com/iam/) console.
2. Click **Users** on the left navigation and then click **Add User**.
3. Enter a **User Name**, check the checkbox for **AWS Management Console** access, enter a **Custom Password,** and click **Next:Permissions**.
4. Click **Attach existing policies directly**, click the checkbox next to the **AdministratorAccess**, and click **Next:review**.
5. Click **Create User**
6. Click **Dashboard** on the left navigation and use the **IAM users sign-in link** to login as the admin user you just created."

To setup the workshop environment, launch the CloudFormation stack below in the **ap-southeast-2** AWS region using the "Deploy to AWS" links below. This will automatically take you to the console to run the template. In order to complete these workshops, you'll need a valid, usable AWS Account. Use a personal account or create a new [AWS account](https://aws.amazon.com/getting-started/) to ensure you have the necessary access and that you do not accidentally modify corporate resources. Do not use an AWS account from the company you work for. **We strongly recommend that you use a non-production AWS account for this workshop such as a training, sandbox or personal account. If multiple participants are sharing a single account you should use unique names for the stack set and resources created in the console.**

| Lab | Template | Region |
|-----|----------|---------|
| Lab 4 - AWS Secrets Manager with Amazon RDS and AWS Fargate | [![](/images/deploy-to-aws.png)](https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-2#/stacks/new?stackName=secrets&templateURL=https://patesumi-webcontent.s3-ap-southeast-2.amazonaws.com/downloads/secretsmgr.yml) | AP Southeast 2 (Sydney) |

1. Click **Next** on the Specify Template section.

2. Click **Next** on the Specify stack details section

3. Click **Next** on the Configure stack options section.

4. Finally, acknowledge that the template will create IAM roles under Capabilities and click **Create**.

This will bring you back to the CloudFormation console. You can refresh the page to see the stack starting to create. Before moving on, make sure the stack is in a **CREATE_COMPLETE** status. 

{{% /expand%}}


{{%expand "Click here if you are at an AWS event where the Event Engine is being used" %}}

### Confirm the CFN template has been deployed

Browse to [AWS CloudFormation Console](https://ap-southeast-2.console.aws.amazon.com/cloudformation)
You should see the stacks as displayed below deployed in your account. Look for the Stack that has the description "Session Manager Workshop"

![](/images/sec-2.png)

Confirm it has been deployed successfully, Status should be "***CREATE_COMPLETE***", if not reach out to the support team for help.

{{% /expand%}}
