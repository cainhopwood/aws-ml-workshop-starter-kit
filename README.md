# Base Portal For AWS ML Workshops

This project is the framework for an AWS AI/ML Workshop portal. It can be cloned and populated with content it can be used to create a temporary website for an online workshop with event engine, help etc

## Development

We'll remove this section once the Portal is in a clean, stable, ready to be cloned state

## Instructions for Contributors

### Setup site locally
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
1. Likewise adjust the "Description" meta data. This is used in the agenda and overview pages of the site.
1. You can also adjust the weight property, which controls what order the lab appears in menus etc. Leavign it at 30 is fine. 
1. Replace the two introductory paragraphs.
1. Edit the URL in the Lab Overview section to point to your pre-recorded video.
1. Edit "CFTemplate" and "CFTemplateName" in the meta data. This is used both in the help instructions, and in the "links" section of the event site to generate *magic links* that deploy in a participants aws console. At this point the CFTemplate must be an S3 URL (That may change). If your workshop doesn't have a CF Template, leave that value empty and the tempaltes will adapt.

The Workshop template consists of an example with an overview/scenario page and two pages with Lab Steps. You can add/remove steps as required, just be sure to adjust the "weight" property in the metadata section on each page to reflect it's order so that menus etc show the steps in the desired order.


### Create A New On Demand Talk


### TODOs

ToDos are in Quip. 

## Instructions for new workshop deployment

This github repo is a framework you can customise to your workshop topic and populate with labs, videos and content. Once that's coen you can use the cloud formation template to deploy the site.

General Steps to developing a new workshop:

1. Clone this repo.
1. Adjust Event title, description and other parameters in config.toml. These are used throughout the template.
1. Edit the XXX and XXXX pages with your general descriptions
1. Add survey QR codes/links
1. Get contributors to add to your clone using the instructions below.
1. Deploy.

