# Challenge 4: Your First Deployment

[< Previous Challenge](./03-k8sintro.md) - **[Home](../README.md)** - [Next Challenge >](./05-scaling.md)

## Introduction

Now the rubber meets the road.... we will be deploying the application to our newly minted cluster and making sure it works as intended. You'll learn about pods, deployments and services, oh my!

## Description

In this challenge we need to get our application up and running in Kubernetes. We will learn about Kubernetes configuration YAML files used to create the various Kubernetes resources that will be needed to run our app. We will give our containers resource limits and open the app up to the outside world so we can test it.

**NOTE:** If you have not or could not deploy your containers to the Azure Container Registry, we have staged the FabMedical apps on Docker Hub at these locations:
- **API app:** whatthehackmsft/content-api
- **Web app:** whatthehackmsft/content-web


### Deploy the **API app** from the command line using kubectl and YAML files:

- **NOTE:** Sample YAML files to get you started can be found in the Student Resources folder.
- Configuration details:
  - Number of pods: 1
  - Service: Internal
  - Port and Target Port: 3001
  - CPU: 0.5
  - Memory: 128MB
- Make sure you correctly set the CPU & Memory resource requests specified above.
- We have not exposed the API app to the external world. Therefore, to test it you need to:
	- Figure out how to get a bash shell on the API app pod just deployed.
    	- _Hint: Review the kubernetes docs for instructions, or feel free to use a GUI tool_
	- From the terminal, curl the url of the `/speakers` end point.
	- You should get a huge json document in response.
   
### Deploy the Web app from the command line using kubectl and YAML files
- **NOTE:** Sample YAML files to get you started can be found in the Files section of the General channel in Teams.
- **NOTE:** The Web app expects to have an environment variable pointing to the URL of the API app named:
	- **CONTENT_API_URL**
- Create a deployment yaml file for the Web app using the specs from the API app, except for:
	- Port and Target Port: 3000
- Create a service yaml file to go with the deployment
	- **Hint:** Not all "types" of Services are exposed to the outside world
- **NOTE:** Applying your YAML files with kubectl can be done over and over as you update the YAML file. Only the delta will be changed.
- **NOTE:** The Kubernetes documentation site is your friend. The full YAML specs can be found there: <https://kubernetes.io/docs>
- Find out the External IP that was assigned to your service. You can use kubectl for this, or you can look at 'Services' in the Azure portal.
- Test the application by browsing to the Web app's external IP and port and seeing the front page come up.
	- Ensure that you see a list of both speakers and sessions on their respective pages.
	- If you don't see the lists, then the web app is not able to communicate with the API app.

## Success Criteria

1. You have the **content-api** container image deployed and can get data from the `/speakers` endpoint.
1. You have the **content-web** container deployed and can access its page from the open internet.
1. The `/speakers` and `/sessions` pages display speakers and sessions respectively, not just blank pages.

## Learning Resources
* [Kubernetes Resource requests](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits)
* [Kubernetes Service Types](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)
* [kubectl cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)


## My Notes
In order to get the public ip try:
```
 kubectl get services
```