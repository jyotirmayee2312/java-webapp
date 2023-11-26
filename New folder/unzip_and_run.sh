#!/bin/bash

# Download artifact from S3
aws s3 cp s3://codepipeline-ap-south-1-803549830893/JYOTI-01 /opt/myapp/artifact.zip || exit 1

# Unzip the artifact
unzip -q /opt/myapp/artifact.zip -d /opt/myapp/extracted || exit 1

# Run the Java JAR file
java -jar /opt/myapp/extracted/app.jar
