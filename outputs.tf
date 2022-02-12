output "access_id" {
  value = aws_iam_access_key.this.id
}

output "access_secret" {
  value = aws_iam_access_key.this.secret
}
