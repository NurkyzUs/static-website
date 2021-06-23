# Hosting a Secure Static Website with AWS by using a Terraform


* ## Prerequisites:
    - [Terraform](https://www.terraform.io) Version ~> 0.15.0  
    and AWS Version ~> 3.40.0 installed on VSCode(or any code editor)

 
 * ##  AWS Services which we need to create:
    - ### S3 bucket [s3_bucket.tf](s3_bucket.tf) 
        * bucket for our domain to host a website
    
    - ### CloudFront (OAI) [cloudfront.tf](cloudfront.tf) : 
        * CloudFront Distribution for S3 bucket
        * OAI to access S3 bucket privately

    - ### Route53 (hosted zone) [route53.tf](route53.tf)
        * alias records for domain with www and without
    
    - ### ACM SSL Certificate
        * SSL Certificate for our domain 



- ## Terraform commands to run:
```
    
 terraform init
``` 
Initialize our code 

```
terraform validate
```
Check if the configuration is valid

```
terraform plan
``` 
Show changes required by the current configuration

```
terraform apply
```
Create or update the infrastructure

```
terraform destroy
```
Destroy the current infrastructure
       
    
        




