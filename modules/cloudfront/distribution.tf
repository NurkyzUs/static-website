// resource "aws_cloudfront_distribution" "s3_distribution" {
//   origin {
//     domain_name = aws_s3_bucket.first_bucket.bucket_regional_domain_name
//     origin_id   = local.s3_origin_id

//     s3_origin_config {
//       origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
//      }
//    }
// }