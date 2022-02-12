variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}

variable "name_prefix" {
  description = "Name prefix"
  type        = string
}

variable "cdn_url" {
  description = "The name of the bucket should match the name of your desired CDN subdomain. I.E.: cdn.spofibo.com"
  type        = string
}

variable "cors_allowed_headers" {
  description = "Set of headers that are specified in the Access-Control-Request-Headers header"
  type        = list(any)
  default     = ["*"]
}

variable "cors_allowed_methods" {
  description = "Set of HTTP methods that the origin is allowed to execute"
  type        = list(any)
  default     = ["GET"]
}

variable "cors_allowed_origins" {
  description = "Set of origins customers are able to access the bucket from"
  type        = list(any)
}

variable "cors_expose_headers" {
  description = "Set of headers in the response that customers are able to access from their applications"
  type        = list(any)
  default     = ["ETag"]
}

variable "cors_max_age_seconds" {
  description = "The time in seconds that browser can cache the response for a preflight request"
  type        = number
  default     = 3000
}

variable "enable_cloudflare_access" {
  description = "Toggle to enable Cloudflare access to the CDN bucket"
  type        = bool
  default     = false
}

variable "cloudflare_ips" {
  description = "List of Cloudflare IP addresses that have access to the CDN bucket"
  type        = list(any)
  default = [
    "2400:cb00::/32",
    "2606:4700::/32",
    "2803:f800::/32",
    "2405:b500::/32",
    "2405:8100::/32",
    "2a06:98c0::/29",
    "2c0f:f248::/32",
    "173.245.48.0/20",
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "141.101.64.0/18",
    "108.162.192.0/18",
    "190.93.240.0/20",
    "188.114.96.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "162.158.0.0/15",
    "172.64.0.0/13",
    "131.0.72.0/22",
    "104.16.0.0/13",
    "104.24.0.0/14"
  ]
}
