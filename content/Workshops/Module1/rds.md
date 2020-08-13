+++
title = "2. RDS with Secrets Manager"
date = 2019-11-18T17:11:28+11:00
weight =6
+++


## Overview

In this phase, you will learn how to use AWS Secrets Manager for rotating the password for a private Amazon RDS database. As a reminder, the environment provisioned by CloudFormation is shown in the figure below. You will not be working with the AWS Fargate container in this phase so it is not shown below.

![](/images/secrets-1.png)

## Important

For the sake of simplicity, this tutorial uses jq to parse the secret value into environment variables to allow for easy command line manipulation. This is NOT a security best practice for a production environment. In a production environment, we recommend that you don't store passwords in environment variables. Click [here](https://docs.aws.amazon.com/secretsmanager/latest/userguide/best-practices.html) to read about the best practices for using Secrets Manager.

## View the CloudFormation stack
- Go to the CloudFormation console and identify the stack that you built. Make sure you are in the correct region. The list of stacks will look similar to the figure below. The appearance may vary based on the version of the console you are using. Your stack will have a description of **Workshop for AWS Secrets Manager with Amazon RDS and AWS Fargate**.
![](/images/sec-2.png)

- Click the stack name link to reveal more information about the stack as shown in the figure below.
![](/images/sec-3.png)
- Click the Outputs tab as shown in the figure above to list the outputs of the stack which will be similar to the figure below.
![](/images/sec-4.png)

The meanings of the output values are described in the table below.


| Key | Meaning of Value |
|-----------|---------|
|BastionIP| The IP address of the bastion host |
|DBInstance| The Amazon RDS instance id |
|DBPassword| The master password of the RDS data base |
|DBUser| The master user of the RDS data base |
|EC2UserPassword| The password for the ec2-user id |
|ECRRepository| The ECR repository id |
|ECSCluster| The ECS cluster id |


You will need the values in the DBInstance, DBPassword, DBUser, and EC2UserPassword outputs in the next section so copy them to a file on your desktop so they are readily available.


## Store the secret
In this section, you will store the RDS database credentials in AWS Secrets Manager.
- Go to the [Secrets Manager console](https://console.aws.amazon.com/secretsmanager).
- Check your region to make sure the Secrets Manager console is operating in the ap-southeast-2 region.
- Click **Store a new secret**.
- Select the **Credentials for RDS database** radio button.
- Copy the values for the DBUser and DBPassword CloudFormation output values that you got from the CloudFormation stack into the **User name** and **Password** fields respectively.
- For the encryption key, Secrets Manager gives you the option of using the default KMS key that Secrets Manager creates for your account. This default key is managed by Secrets Manager itself. It provides encryption but you do not have the ability manage the policies or grants for the key. You can also specify your own KMS key which gives you more the option of configuring grants and policies that provide more granular permissions. In a production environment that requires fine-grained security controls, you would likely choose your own key. For this workshop we do not require these additional controls so select **DefaultEncryptionKey** in the dropdown menu.
- Scroll down to the bottom of the page and you will see a list of your RDS instances. Select the RDS instance based on the DBInstance CloudFormation output value.
![](/images/sec-5.png)
- Click **Next**.
- Enter a name for the secret. Use **smdemo** as shown below.
![](/images/sec-6.png)
- Click **Next**.
- Select **Disable automatic rotation** and then click **Next**. We will enable rotation later in this module.
![](/images/sec-7.png)
- Click **Store**.

You have now stored your secret value as shown below.
![](/images/sec-10.png)

## Access the database
In this section, you will connect to the bastion host so you can run scripts that the CloudFormation template has created on the instance.

- Connect to the bastion host using AWS Systems Manager Session Manager. To do this:
  - Go to the [Systems Manager console](https://console.aws.amazon.com/systems-manager).
  - Click **Session Manager**.
  - Click **Start session**.
  - Select the radio button for the instance called **smdemo-host**.
  - Click **Start session**.


- The scripts you will be using are owned by the ec2-user account. Enter the command below to change your effective user id and directory to those of ec2-user:
```
sudo su - ec2-user
```
- Display the current directory using this command:
```
ls
```
You will see two shell scripts.
  - mysql.oldway.sh - This shell script connects to the database the "old" way, using a hard-coded password.
  - mysql.newway.sh - This shell script connects to the database the "new" way, using AWS Secrets Manager.
- View the file mysql.oldway.sh using this command:
```
cat mysql.oldway.sh
```

You will see contents similar to the lines below. The values PASSWORD, USER, and ENDPOINT represent the hard-coded database password, username, and host endpoint.
```
(Note: This code fragment is for illustration only and not intended for copying.)

#/bin/bash

# mysql.oldway.sh

# This is the old way of accessing a database, with a hard-coded password.
# This script will only work right after the CloudFormation template runs.
# After you store and rotate the secret, you will need to use the
# mysql.newway.sh script.

mysql \
-pPASSWORD \
-u USER \
-P 3306 \
-h ENDPOINT
```

- Test the script mysql.oldway.sh using the commands shown below. The first command invokes the script. The subsequent commands select the database, display the table names in the database, query the rows in the table, and exit MySQL. Note that MySQL commands end with a semicolon (";").
```
./mysql.oldway.sh
use smdemo;
show tables;
select * from bookinfo;
quit;
```

You can see an example of the output below. This shows that you can access the database, the "old" way, with a hard-coded user name and password. You may be wondering why MariaDB appears in the image below. Amazon Linux 2 includes the MariaDB port of the mysql command as an "extras" module. The mysql program is compatible with both MySQL and MariaDB.
![](/images/sec-11.png)

- View the file mysql.newway.sh by entering this command:
```
cat mysql.newway.sh
```
Take a look at the lines below.
```
(Note: This code fragment is for illustration and not intended for copying.)

getsecretvalue() {
  aws secretsmanager get-secret-value --secret-id $1 | \
    jq .SecretString | \
    jq fromjson
}
```
The above lines define a shell function that uses the AWS CLI to retrieve the secret whose name is passed as a command line argument ($1). The result is a JSON string so the jq utility is used to extract the actual value of the secret whose JSON key is named SecretString. Here is an example of what a SecretString looks like:
```
(Note: This code fragment is for illustration and not intended for copying.)

{
  "engine": "mysql",
  "username": "myuser",
  "password": "mypassword",
  "host": "my-database-endpoint.ap-southeast-2.rds.amazonaws.com",
  "dbname": "myDatabase",
  "port": "3306"
}
```

Note that the SecretString itself is a JSON structure. Now look at the following lines.
```
(Note: This code fragment is for illustration and not intended for copying.)

secret=`getsecretvalue $1`
user=$(echo $secret | jq -r .username)
password=$(echo $secret | jq -r .password)
endpoint=$(echo $secret | jq -r .host)
port=$(echo $secret | jq -r .port)
```

These lines call the shell function and then use jq to extract the database username, password, endpoint, and port from the SecretString. These are then passed to the mysql command as shown on the lines below. Note that there is no space after the -p option.
```
(Note: This code fragment is for illustration and not intended for copying.)

mysql \
-p$password \
-u $user \
-P $port \
-h $endpoint
```

- Run the mysql.newway.sh script by running the commands below. The first command invokes the script. **Note that you must specify the name of the secret!** In this example, the secret's name is smdemo. The subsequent commands select the database, display the table names in the database, query the rows in the table, and exit MySQL.
```
./mysql.newway.sh smdemo
use smdemo;
show tables;
select * from bookinfo;
quit;
```

You can see an example of the output below. This shows that you can access the database, the "new" way, using AWS Secrets Manager.
![](/images/sec-12.png)

## Rotate the secret
In this section, you will enable the rotation of the secret you created in AWS Secrets Manager.



- Go to the [Secrets Manager console](https://console.aws.amazon.com/secretsmanager).
- Check your region to make sure the Secrets Manager console is operating in the ap-southeast2 region. 
- Click on the secret that you previously created.
- Click **Edit rotation**.
- Select **Enable automatic rotation**.
- Choose **30 days** for the rotation interval.
- Select the **Create a new Lambda function to perform rotation** radio button. This will cause Secrets Manager to use CloudFormation on your behalf to create a rotation function using the AWS Serverless Application Repository. If you had customized your own rotation function or if you were using a credential for a special application, you would select that here.
- Enter a name for the rotation function. In the figure below, we used **smdemo** but you can select whatever you wish.
- You now need to select the secret whose permissions will be used to rotate the secret. For this Builder Session, select **Use this secret**. This will tell the rotation function to access the RDS database using the secret and rotate the same secret.

If your application supports two classes of users, for example a "superuser" and a "normal privilege" user, you could select **Use a secret that I have previously stored in Secrets Manager** and use the "superuser" credential to rotate the credential for the "normal privilege" user.

Your window should look similar to the figure below.
![](/images/sec-13.png)
- Click **Save**.
- You will see a message telling you that the rotation is beginning and that you should remain on the page until it is complete. AWS Secrets Manager is now using the [AWS Serverless Application Repository](https://aws.amazon.com/serverless/serverlessrepo/) to install an [AWS Lambda rotation](https://aws.amazon.com/lambda/) function on your behalf. **Do not leave this page until the rotation is complete**.
![](/images/sec-14.png)

{{% notice note %}}
If you see the following error message, goto the [AWS Lambda](https://ap-southeast-2.console.aws.amazon.com/lambda/home?region=ap-southeast-2#/functions) and verify the Lambda function **secretsManagersmdemo** exists, than follow the above [Rotate steps](https://awscloudsecvirtualevent.com/workshops/module4/rds/#rotate-the-secret) again but this time selecting **Use an existing lambda function to perform rotation** and choose **secretsManagersmdemo** Lambda function to enable automatic rotation. ![](/images/error-rotate.png) {{% /notice %}}


A message will appear when the rotation is complete. **Refresh your browser window to update your any cached fields**.
![](/images/sec-15.png)
- Click **Retrieve secret value** to see the new password value.

## Access the database

Let's try to connect to the database again, both the "old" way with a hard-coded password, the "new" way with AWS Secrets Manager.

- On the bastion host, run the command below to access the database using the hard-coded password.
```
./mysql.oldway.sh
```
You should receive an error message (access denied) because the mysql.oldway.sh script has the same hard-coded password.
![](/images/sec-16.png)

- Run the commands below to access the database with Secrets Manager by running the commands below. **Note that you must specify the name of the secret!** In this example, the secret's name is smdemo. You should be able to access the database as you did before because Secrets Manager fetches the new credential rather than using a hard-coded credential.
```
./mysql.newway.sh smdemo
use smdemo;
show tables;
select * from bookinfo;
quit;
```

You have completed ths RDS phase and have learned how to use AWS Secrets Manager with Amazon RDS. You will now continue to the Fargate phase.



---

### *Stuck? Watch this*

{{% notice note %}} 
*This video has no audio*{{% /notice %}}

{{< rawhtml >}}
<video width="696" height="392" controls>
  <source src="https://d1tqhetmq9f85b.cloudfront.net/downloads/lab4.2.mp4" type="video/mp4">
  Your browser doesn't support video.
</video>
{{< /rawhtml >}}
