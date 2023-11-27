#!/bin/bash

# Download artifact from S3
aws s3 cp s3://codepipeline-ap-south-1-803549830893/JYOTI-01.zip /opt/myapp/artifact.zip || exit 1

# Unzip the artifact
unzip -q /opt/myapp/artifact.zip -d /opt/myapp/extracted || exit 1
