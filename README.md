# Wordpress W3TC CDN for AWS Terraform module
Terraform module which creates the S3, IAM and policies required for W3TC's CDN feature

## Usage

```terraform
module "mysite_w3tc" {
  source = "github.com/Spofibo/terraform-aws-wordpress-w3tc"

  name_prefix              = "site"
  cdn_url                  = "cdn.site.com"
  cors_allowed_origins     = ["https://site.com"]
  enable_cloudflare_access = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_url"></a> [cdn\_url](#input\_cdn\_url) | The name of the bucket should match the name of your desired CDN subdomain. I.E.: cdn.spofibo.com | `string` | n/a | yes |
| <a name="input_cloudflare_ips"></a> [cloudflare\_ips](#input\_cloudflare\_ips) | List of Cloudflare IP addresses that have access to the CDN bucket | `list(any)` | <pre>[<br>  "2400:cb00::/32",<br>  "2606:4700::/32",<br>  "2803:f800::/32",<br>  "2405:b500::/32",<br>  "2405:8100::/32",<br>  "2a06:98c0::/29",<br>  "2c0f:f248::/32",<br>  "173.245.48.0/20",<br>  "103.21.244.0/22",<br>  "103.22.200.0/22",<br>  "103.31.4.0/22",<br>  "141.101.64.0/18",<br>  "108.162.192.0/18",<br>  "190.93.240.0/20",<br>  "188.114.96.0/20",<br>  "197.234.240.0/22",<br>  "198.41.128.0/17",<br>  "162.158.0.0/15",<br>  "172.64.0.0/13",<br>  "131.0.72.0/22",<br>  "104.16.0.0/13",<br>  "104.24.0.0/14"<br>]</pre> | no |
| <a name="input_cors_allowed_headers"></a> [cors\_allowed\_headers](#input\_cors\_allowed\_headers) | Set of headers that are specified in the Access-Control-Request-Headers header | `list(any)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_cors_allowed_methods"></a> [cors\_allowed\_methods](#input\_cors\_allowed\_methods) | Set of HTTP methods that the origin is allowed to execute | `list(any)` | <pre>[<br>  "GET"<br>]</pre> | no |
| <a name="input_cors_allowed_origins"></a> [cors\_allowed\_origins](#input\_cors\_allowed\_origins) | Set of origins customers are able to access the bucket from | `list(any)` | n/a | yes |
| <a name="input_cors_expose_headers"></a> [cors\_expose\_headers](#input\_cors\_expose\_headers) | Set of headers in the response that customers are able to access from their applications | `list(any)` | <pre>[<br>  "ETag"<br>]</pre> | no |
| <a name="input_cors_max_age_seconds"></a> [cors\_max\_age\_seconds](#input\_cors\_max\_age\_seconds) | The time in seconds that browser can cache the response for a preflight request | `number` | `3000` | no |
| <a name="input_enable_cloudflare_access"></a> [enable\_cloudflare\_access](#input\_enable\_cloudflare\_access) | Toggle to enable Cloudflare access to the CDN bucket | `bool` | `false` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_id"></a> [access\_id](#output\_access\_id) | n/a |
| <a name="output_access_secret"></a> [access\_secret](#output\_access\_secret) | n/a |
<!-- END_TF_DOCS -->
