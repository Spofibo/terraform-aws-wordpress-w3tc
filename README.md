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
| [aws_s3_bucket_cors_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_url"></a> [cdn\_url](#input\_cdn\_url) | The name of the bucket should match the name of your desired CDN subdomain. I.E.: cdn.spofibo.com | `string` | n/a | yes |
| <a name="input_cloudflare_ips"></a> [cloudflare\_ips](#input\_cloudflare\_ips) | List of Cloudflare IP addresses that have access to the CDN bucket | `list(any)` | <pre>[<br>  "2400:cb00::/32",<br>  "2606:4700::/32",<br>  "2803:f800::/32",<br>  "2405:b500::/32",<br>  "2405:8100::/32",<br>  "2a06:98c0::/29",<br>  "2c0f:f248::/32",<br>  "173.245.48.0/20",<br>  "103.21.244.0/22",<br>  "103.22.200.0/22",<br>  "103.31.4.0/22",<br>  "141.101.64.0/18",<br>  "108.162.192.0/18",<br>  "190.93.240.0/20",<br>  "188.114.96.0/20",<br>  "197.234.240.0/22",<br>  "198.41.128.0/17",<br>  "162.158.0.0/15",<br>  "172.64.0.0/13",<br>  "131.0.72.0/22",<br>  "104.16.0.0/13",<br>  "104.24.0.0/14"<br>]</pre> | no |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | n/a | <pre>list(object({<br>    allowed_headers : list(string)<br>    allowed_methods : list(string)<br>    allowed_origins : list(string)<br>    expose_headers : list(string)<br>    max_age_seconds : number<br>  }))</pre> | <pre>[<br>  {<br>    "allowed_headers": [<br>      "*"<br>    ],<br>    "allowed_methods": [<br>      "GET"<br>    ],<br>    "allowed_origins": [<br>      "*"<br>    ],<br>    "expose_headers": [<br>      "ETag"<br>    ],<br>    "id": "",<br>    "max_age_seconds": 3000<br>  }<br>]</pre> | no |
| <a name="input_enable_cloudflare_access"></a> [enable\_cloudflare\_access](#input\_enable\_cloudflare\_access) | Toggle to enable Cloudflare access to the CDN bucket | `bool` | `false` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_id"></a> [access\_id](#output\_access\_id) | n/a |
| <a name="output_access_secret"></a> [access\_secret](#output\_access\_secret) | n/a |
<!-- END_TF_DOCS -->
