+++
title = "Lab 1: AWS Secrets Manager with Amazon RDS and AWS Fargate"
date = 2019-11-18T08:23:04+11:00
weight = 30
chapter = false
+++

This Secrets Manager lab guides you through the use of AWS Secrets Manager with Amazon RDS and AWS Fargate . In the first phase you will access the RDS database with Secrets Manager. You will then use Secrets Manager to rotate the data base password. You will then use Secrets Manager to access the database again to show that you can continue to access the data base after the rotation.

In the second phase of the lab, you will extend your use of Secrets Manager into an AWS Fargate container. You will create an Amazon ECS task definition to pass secrets to the Fargate container and then launch the Fargate container. You will then SSH into the container to show that the secret was passed to the container and that you can access the RDS data base.



### Lab Overview

{{< rawhtml >}}
<video width="696" height="392" controls>
  <source src="https://d1tqhetmq9f85b.cloudfront.net/downloads/apacsecweek-lab4.mp4" type="video/mp4">
  Your browser doesn't support video.
</video>
{{< /rawhtml >}}

>  **Speakers: Chamandeep Singh (AWS), Julian Hickie (Cloudten)** 

>  *In this video, you’ll also hear from our partner [Cloudten](https://bit.ly/Cloud_Ten)  highlighting a real-world example of the deployment of the AWS services you’ll use in this demo. For more information, please visit [here](https://bit.ly/Cloud_Ten)*


### Lab Steps
{{% children depth=2 %}}


Click [here](../module1/scenario/) to get started!
