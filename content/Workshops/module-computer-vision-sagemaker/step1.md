+++
title = "Instructions"
date = 2019-11-18T17:11:28+11:00
weight =6
+++


## Overview

In this workshop, we will demonstrate how to train and host a semantic segmentation model using the Semantic Segmentation built-in algorithm with Deeplab-v3 backbone on a SpaceNet dataset to train a building segmentation model.

In this section, we will go through the Jupyter notebook that demonstrates how to use the built-in algorithm in SageMaker with the SpaceNet dataset. We will use the SpaceNet SN6: Multi-Sensor All-Weather Mapping dataset. The data is hosted on AWS as a [public dataset on Amazon S3](https://registry.opendata.aws/spacenet/). 

Synthetic Aperture Radar (SAR) is a unique form of radar that can penetrate clouds, collect during all- weather conditions, and capture data day and night. In this example, we will process it like a regular image and focus on demonstrating the use of the SageMaker to build and host a Semantic Segmentation model.


The data is over 120 sq km of both high resolution synthetic aperture radar (SAR) data and electro optical (EO) imagery with ~48,000 building footprint labels of Rotterdam, The Netherlands

### 1. Running the notebook

1. Open the Satellite Segmentation folder and open double click on the SpaceNet-SAR-Building-Segmentation.ipynb notebook to open it


![](/images/computer-vision-sagemaker/notebook.png)
> Open the notebook

2. Make sure that you select the correct kernel to run the notebook: gdal_python36

![](/images/computer-vision-sagemaker/kernel.png)
> Select the right kernel

You can now follow the instructions in the notebook to keep going!
