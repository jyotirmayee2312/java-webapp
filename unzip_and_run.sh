#!/bin/bash

# Copy the new .war file to the deployment directory
cp /opt/myapp/myapp.zip /opt/myapp/myapp.war || exit 1

# Start the Java application using the .war file
java -jar /opt/myapp/myapp.war
