locals {
  s3_access = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:DeleteObject",
          "s3:GetObject",
          "s3:GetObjectAcl",
          "s3:ListBucket",
          "s3:PutObject",
          "s3:PutObjectAcl"
        ],
        Resource = [
          "#BUCKET",
          "#BUCKET/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets"
        ],
        Resource = "arn:aws:s3:::*" // TODO: lock this down to only the bucket?
      },
    ]
  })

  cloudflare_access = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "#BUCKET",
        "Condition" = {
          "IpAddress" = {
            "aws:SourceIp" = var.cloudflare_ips
          }
        }
      }
    ]
  })
}

################################
# IAM                          #
################################
resource "aws_iam_user" "this" {
  name = "${var.name_prefix}-w3tc-cdn"
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "this" {
  name = "${var.name_prefix}-access-to-s3-for-w3tc"
  user = aws_iam_user.this.name

  policy = replace(local.s3_access, "#BUCKET", aws_s3_bucket.this.arn)
}

################################
# S3                           #
################################
resource "aws_s3_bucket" "this" {
  bucket = var.cdn_url
}

resource "aws_s3_bucket_cors_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  dynamic "cors_rule" {
    for_each = var.cors_configuration

    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.enable_cloudflare_access ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = replace(local.cloudflare_access, "#BUCKET", "${aws_s3_bucket.this.arn}/*")
}
