# Base Portal For AWS ML Workshops

This project is the framework for an AWS AI/ML Workshop portal. Once clones and populated with content it can be used to create a temporary website for an online workshop with event engine, help etc

## Development

We'll remove this section once the Portal is in a clean, stable, ready to be cloned state

### Setup

Install hugo as per https://gohugo.io/getting-started/installing/

Clone this repo, cd to the directory and run:
```
hugo server
```

You should then have a site being served out of http://localhost:1313/

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

## Info for Contributors

Firstly ensure that you're working in