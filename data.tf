data "aws_iam_policy_document" "simileoluwapolicy" {
statement {
actions =  ["s3:GetObject"]

principals{
    type = "AWS"
    identifiers = ["*"]
}

resources = [
aws_s3_bucket.simileoluwabucket.arn,
"${aws_s3_bucket.simileoluwabucket.arn}/*"
]
}
}