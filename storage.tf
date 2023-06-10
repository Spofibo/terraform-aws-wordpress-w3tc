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
