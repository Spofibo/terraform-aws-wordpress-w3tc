variable "name_prefix" {
  description = "Name prefix"
  type        = string
}

variable "cdn_url" {
  description = "The name of the bucket should match the name of your desired CDN subdomain. I.E.: cdn.spofibo.com"
  type        = string
}

variable "cors_configuration" {
  description = "S3 bucket CORS configuration"
  type = list(object({
    allowed_headers : list(string)
    allowed_methods : list(string)
    allowed_origins : list(string)
    expose_headers : list(string)
    max_age_seconds : number
  }))
  default = [
    {
      allowed_headers : ["*"],
      allowed_methods : ["GET"],
      allowed_origins : ["*"],
      expose_headers : ["ETag"],
      max_age_seconds : 3000,
      id : ""
    }
  ]
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
