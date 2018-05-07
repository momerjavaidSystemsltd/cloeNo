# Node.js sample app

Sample node.js application

# Docs
#### Create repositry
  - Push README.md file

#### Create S3 bucket to hold bundled zip of code
  - Bucket must be private

#### Create Auto Scaling Group
  - Install CodeDeploy Agent either using user data or launch config
  - Create and assign IAM Role to instances using launch config for CodeDeploy agent

#### Create AWS CodeDeploy Applicaton and Deployment Config
  - Create IAM Role for service
  - Create Deployment Config ( CodeDeployCustom.30PercentAtOnce - minimum healthy should be 70% )
  - Create Application
    - Create Deployment Group for Auto Scaling Group

#### Jenkins Server Up
 - Install webhook, git plugin
 - Add Instance Profile to call aws services
   - Add permission to access S3 Bucket access
   - Add permission to call AWS CodeDeploy deployment
 - Create Jenkins Job 
   - Configure Repository access read only credentials using SSH
   - Configure Pipeline script from SCM to call Jenkinsfile ( lightweight Checkout )

#### Push Jenkinsfile, AWS CodeDeploy files, and Code to Repo
  - Write & Push Application code
  - Write & Push Jenkinsfile
  - Write & Push AWS CodeDeploy files
    - Write appspec.yml      [ Required ]
    - Write beforeInstall.sh [ Optional ]
    - Write afterInstall.sh  [ Optional ]

#### Test your code
#### Manually deploy your code using CodeDeploy
#### And finally for automated deployments
  - Configure Webhook in Jenkins and Repository ( you must use secret to call webhook )