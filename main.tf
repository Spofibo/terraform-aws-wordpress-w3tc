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