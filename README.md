# Base Portal For AWS ML Workshops

This project is the framework for an AWS AI/ML Workshop portal. It can be cloned and populated with content it can be used to create a temporary website for an online workshop with event engine, help etc.

Currently this repo is being used for an upcoming AI/ML workshop, but it can easily be made generic for other topics, and in fact already has some work done in that area already.

## Instructions for AI/ML Worksop Contributors

### Setup Site To Run Locally

Strictly speaking, as all you should need to do is edit markdown and copy images into the repo, it's possible to just push updates to the repo and use the public site to check your workshop. But, if you take that approach you'll have to live with a delay after each push as the site is deployed to check your changes. Running locally is fairly easy for Mac, Windows and Linux usign the followign instructions.
  
Install hugo as per https://gohugo.io/getting-started/installing/

in a local directory clone this repo and run hugo to confirm you have the site working locally
```
git clone https://github.com/cainhopwood/aws-ml-workshop-starter-kit.git
hugo server
```

You should then have a site being served out of http://localhost:1313/

### Instructions for Contributors (Create A New Workshop)

Once you have the site down locally and/or running create a new workshop with the following steps:

1. Copy the Content Folder "Workshops/module-template" to "Workshops/module-XXXX" Where XXXX is the name of your workshop.
1. Copy/Create an Images Folder "static/images/module-XXXX" 
1. Edit "Workshops/module-XXXX/_index.en.md" In the top of this file you'll see a metadata section delimited by "+++" adjust the "title" property to reflect your workshop name.
1. Likewise adjust the "Description", "Difficulty", and "Time" meta data. This is used in the agenda and overview pages of the site.
1. You can also adjust the weight property, which controls what order the lab appears in menus etc. Leavign it at 30 is fine. 
1. Replace the two introductory paragraphs,a nd add any other text you feel is useful.
1. Contact @cainhopw to get your video uploaded, then edit the video sortcode in the Lab Overview section to point to it.
1. Also contact Cain to get your github login added to the repo so you can push your changes. 

*Note: Please only make changes in your workshop markdown files, or images directory. 


*Templates*

If you have a Sagemaker notebook based workshop, and will use the common notebook instance for your lab.

1. talk to @cainhopw and get the github repo for the lab materials (notebooks etc) added to the Sagemaker master CF template.
1. Ensure your lab/workshop instructions tell participants which github repo to browse to to get to your jupyter notebooks.

If you have a dedicated cloudformation template for your workshop:
1. Add your CF template to the static/yaml directory. (do *not* create a subdirectory). The build pipeline will pick up this file and create a pre signed S3 URL with a 7 day expiry. 
1. Edit "CFTemplate" and "CFTemplateName" in the meta data of your _index_en.md. Make sure the CFTemplate matches your file exactly. This is used both in the help instructions, and in the "links" section of the event site to generate *magic links* that deploy in a participants aws console using the presigned URLs that the build system will deploy for you.
1. If you want to use your own S3 url, that is OK, it needs to be public. Set the CFTemplate to a http URL pointing at an S3 bucket and the build sytsem will generate an appropriate magic link.
1. Test your links once a build is completed, there's no validation that names match up.

The Workshop template consists of an example with an overview/scenario page a video and two pages with Lab Steps. You can add/remove steps as required, just be sure to adjust the "weight" property in the metadata section on each page to reflect it's order so that menus etc show the steps in the desired order.

Once you've pushed your content to the github repo you can access the live version of the site with your changes at https://d3ezjgxqne0l2q.cloudfront.net/ (bear in mind it maight take a few minutes for the site to deploy once you've pushed to git)


### Create A New On Demand Talk

Each on demand presentation consists of a video and a single page hosting that video. To create a new one following the following steps.

1. Upload your video to Workdocs and let @cainhopw know the location for pulling into the site.
1. Copy the folder security_fundementals in /OnDemandTracks along with the _index.en.md file therein.
1. Adjust the meta data "Title", "Description" etc in the _index.en.md file
1. Adjust the video short link to match the name of the file you uploaded. 

### TODOs

ToDos are in Quip. 

## Instructions Duplicating AI/ML Workshop For Other Topics

*INCOMPLETE* 

This github repo is a framework you can customise to your workshop topic and populate with labs, videos and content. Once that's done you can use the cloud formation template to deploy the site. 

General Steps to developing a new workshop:

1. Clone this repo.
1. Adjust Event title, description and other parameters in config.toml. These are used throughout the template.
1. Edit the XXX and XXXX pages with your general descriptions
1. Add survey QR codes/links
1. Get contributors to add to your clone using the instructions below.
1. Deploy.

