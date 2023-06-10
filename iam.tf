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