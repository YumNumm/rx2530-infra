terraform {
  backend "s3" {
    bucket                      = "tf-state"
    key                         = "rx2530-infra.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
    endpoints                   = { s3 = "https://4270d8a14dfc1f866629099a788c93e2.r2.cloudflarestorage.com" }
  }
}
