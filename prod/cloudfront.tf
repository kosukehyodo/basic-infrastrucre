resource "aws_cloudfront_distribution" "asset" {
    enabled = true
    is_ipv6_enabled = true
    viewer_certificate {
        cloudfront_default_certificate = true
    }

    origin {
        connection_attempts = 3
        connection_timeout = 10
        domain_name = aws_s3_bucket.asset.bucket_regional_domain_name
        origin_id = aws_s3_bucket.asset.bucket_regional_domain_name
        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.asset.cloudfront_access_identity_path
        }
    }

    default_cache_behavior {
        cache_policy_id = "c13fb4a2-a499-47fc-a4b5-6f4f3c0ef0c2"
        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = aws_s3_bucket.asset.bucket_regional_domain_name
        compress = true
        viewer_protocol_policy = "allow-all"
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }
}

resource "aws_cloudfront_cache_policy" "asset" {
    name = "Custom-CachingOptimized"
    # name = "${var.env}-${var.project}-asset"
    default_ttl = 2592000
    min_ttl = 1
    max_ttl = 31536000
    comment = "デフォルト TTLを1ヶ月に変更"
    parameters_in_cache_key_and_forwarded_to_origin {
        enable_accept_encoding_brotli = true
        enable_accept_encoding_gzip = true
        cookies_config {
            cookie_behavior = "none"
        }

        headers_config {
            header_behavior = "none"
        }

        query_strings_config {
            query_string_behavior = "none"
        }
    }
}

resource "aws_cloudfront_origin_access_identity" "asset" {
    comment = "access-identity-sukipi-bucket.s3.ap-northeast-1.amazonaws.com"
}