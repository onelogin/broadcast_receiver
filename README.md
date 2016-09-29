# Broadcast Receiver
## OneLogin events receiver to test Event Broadcasters

## Overview
The included project is for the purpose of receiving onelogin's account activity. It's a small server which gets events from Event Broadcaster and save it to the file, where you can analyze it.

OneLogin will review and test changes proposed by the opensource community on a qarterly basis.

## Build
These projects are written in Ruby. Requirements for building include:

1. `2.3.1` version of Ruby

### Dev Environment Setup Instructions
1. `cd; git clone https://github.com/onelogin/broadcast_receiver.git; cd broadcast_receiver`
2. `bundle`




1. Sync to the latest of onlogin/atlassian
2. cd to the project you would like to build. For example confluence/version4
3. run 'mvn clean install'

The build for confluence version4 may require you to add the customauth-conf jar file to your local maven repo. To do so run the following command from the version4 directory 'mvn install:install-file -Dfile=customauth-conf-0.4.jar -DgroupId=com.onelogin -DartifactId=customauth-conf -Dversion=0.4 -Dpackaging=jar'

The build for Jira version4 may require that you add the customauth-jira jar file to your local maven repo. To do so run the following command from the jira/version4 directory 'mvn install:install-file -Dfile=customauth-jira-0.4.jar -DgroupId=com.onelogin -DartifactId=customauth-jira -Dversion=0.4 -Dpackaging=jar'

The build for Jira version6 has an additional dependency, the latest OneLogin java-saml jar (java-saml-1.1.2.jar), from the onelogin/java-saml project on GitHub. So for building Jira version6 the steps are: 

1. Sync onelogin/java-saml
2. Build onelogin/java-saml (it's also a Maven/Java project). 
3. Run 'mvn clean install' to place the java-saml-1.1.2.jar in your local Maven repository
4. Next pull the lastest from onelogin/atlassian and run 'mvn install' from version6 to bulid your Jira version6 artifacts as above.

## Starting

### Unicorn
`bundle exec unicorn -E production -c config/unicorn.rb`

### Webrik
Development - `bundle exec rackup`

Production - `bundle exec rackup -E production`

## Usage
Evert request data is stored to the `log/broadcast_reciever.log`

Format: `I, [2016-09-12T17:17:10.506751 #54645]  INFO -- Recieved: [{...}]`
