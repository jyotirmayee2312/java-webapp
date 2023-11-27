#!/bin/bash

# Download artifact from S3
aws s3 cp s3://your-bucket-name/path/to/artifact.zip /opt/myapp/artifact.zip || exit 1

# Unzip the artifact
unzip -q /opt/myapp/artifact.zip -d /opt/myapp/extracted || exit 1
