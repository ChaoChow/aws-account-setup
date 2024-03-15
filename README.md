# aws-account-starter

This terraform project sets up 
- S3 bucket for saving terraform state
- DynamoDB to allow for terraform locking (prevents 2 devs from running the same terraform at the same time)

## Getting started

Since this project sets up the resources necessary to store terraform state, the state of this project cannot be persisted as with all of the other terraform projects. This project should be run once in each AWS account locally and should only be run once. Running this project will generate a local terraform state that won't be stored automatically in the AWS resources generated.
