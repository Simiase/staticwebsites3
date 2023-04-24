# S3 bucket for website.
resource "aws_s3_bucket" "simileoluwabucket" {
  bucket = "simileoluwabucket"
  acl    = "public-read"


cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.similowuwabucket"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_s3_bucket_policy" "simileoluwapolicy" {
  bucket = aws_s3_bucket.simileoluwabucket.id
  policy = data.aws_iam_policy_document.simileoluwapolicy.json
}

resource "aws_s3_bucket_object" "website" {
  bucket = aws_s3_bucket.simileoluwabucket.id
  key    = "index.html"
  source = "Ecommerce-app-landing-page-website-master/index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "website_css" {
  bucket = aws_s3_bucket.simileoluwabucket.id
  key    = "style.css"
  source = "Ecommerce-app-landing-page-website-master/style.css"
  content_type = "text/css"
}
resource "aws_s3_bucket_object" "website_js" {
  bucket = aws_s3_bucket.simileoluwabucket.id
  key    = "script.js"
  source = "Ecommerce-app-landing-page-website-master/script.js"
  content_type = "application/javascript"
}

resource "aws_s3_bucket_object" "website_img" {
  bucket = aws_s3_bucket.simileoluwabucket.id
  key    = "img"
  source = "Ecommerce-app-landing-page-website-master/img"
  content_type = "image/jpeg"
}
