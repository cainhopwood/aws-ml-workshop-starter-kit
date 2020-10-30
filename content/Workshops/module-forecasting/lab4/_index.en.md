+++
title = "Anomaly detection from click-stream data using SageMaker RCF and DeepAR"
date = 2019-11-18T17:11:28+11:00
weight = 40
+++

![](/images/module-forecasting/randseries.png)

<br/>

Anomaly detection algorithms are used to find changes in data patterns. They have a wide range of applications, 
from detecting sudden changes in business metrics, detecting failure in complex systems, predictive maintenance, 
and even for monitoring data pipelines for unexpected changes. Some other types of events that can be detected include:
- Changes in the number of visitors or clickstreams on e-commerce websites
- Changes in the number of items sold or the amount of sales in retail business
- Changes in usage of disk, memory or CPU in applications and systems infrastructure
- Changes in values such as temperature, vibration, current, or torque from production machines and equipment

In many cases, humans can easily find irregularities if the data is visualized through a graph. 
But for practical reasons, it is impossible for humans to visually check hundreds of thousands of data 
points generated simultaneously in real time. Also, many anomaly detection systems use static threshold limits. 
Due to frequent changes from seasonality, trending, or daily and hourly cycles, these simple detection systems miss many events, 
or falsely predict to many events. Machine learning algorithms work well for these types of problems as they work 
with more complex data patterns, reducing the false positive and increasing the true positive rates.


### Workshop scope
In this lab, we will build an anomaly detection system for click stream data from a website. 
This system could be used to detect production problems within a website, or even detect changes 
in user behaviour that may need to be addressed. We will use two built-in algorithms provided by Amazon SageMaker, 
Random Cut Forest (RCF) and DeepAR. Amazon SageMaker Random Cut Forest (RCF) is an unsupervised algorithm for detecting 
anomalous data points within a data set. The Amazon SageMaker DeepAR forecasting algorithm is a supervised learning algorithm 
for forecasting scalar (one-dimensional) time series using recurrent neural networks (RNN). By comparing the predicted versus 
the actuals, we can use DeepAR for anomaly detection as well. Amazon Kinesis Data Analytics also provides an RCF function, and 
we will explore using this native anomaly detection function on a real-time stream of data.

### Start the lab

Click [here](./step1/) to get started!