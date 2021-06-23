# Hosting a Secure Static Website with AWS by using a Terraform


* ## Prerequisites:
    - [Terraform](https://www.terraform.io) Version ~> 0.15.0  
    and AWS Version ~> 3.40.0 installed on VSCode(or any code editor)

 
 * ##  AWS Services which we need to create:
    - ### S3 bucket [s3_bucket.tf](s3_bucket.tf) 
        * bucket for our domain to host a website
    
    - ### CloudFront (OAI) [cloudfront.tf](cloudfront.tf) : 
        * CloudFront Distribution for S3 bucket;
        * OAI to access S3 bucket privately

    - ### Route53 (hosted zone)
        * alias records for www and root domain
    
    - ### ACM SSL Certificate
        * SSL Certificate for our domain



- ### Terraform commands:
        * terraform init
        * terraform validate
        * terraform plan
        * terraform appy



