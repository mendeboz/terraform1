resource "aws_s3_bucket" "prod-ftp-backup-mende" {
  bucket = "prod-ftp-backup-mende"  
  acl    = "private"


  lifecycle_rule {
    id      = "prod-ftp-backup-rule"
    enabled = true

    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }

  tags = {
    Name = "prod-ftp-backup"
    Environment = "Production"
    terraform = "true"
  }
}

resource "aws_s3_bucket_public_access_block" "prod-ftp-backup-mende" {
  bucket = aws_s3_bucket.prod-ftp-backup-mende.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "prod-ftp-backup-mende" {
    bucket = aws_s3_bucket.prod-ftp-backup-mende.id

    policy = jsonencode({
        Version = "2012-10-17"
        Id      = "BUCKET-POLICY"
        Statement = [
            {
                Sid       = "AllowSSLRequestsOnly"
                Effect    = "Deny"
                Action    = "s3:*"
                Resource = [
                    "${aws_s3_bucket.prod-ftp-backup-mende.arn}/*",
                    "${aws_s3_bucket.prod-ftp-backup-mende.arn}",
                ]
                Condition = {
                    Bool = {
                        "aws:SecureTransport" = "false"
                    }
                }
                Principal = "*"
            },
        ]
    })
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.prod-ftp-backup-mende.id

  lambda_function {
    lambda_function_arn = "arn:aws:lambda:${var.aws_region}:${var.account_id}:function:run-jenkins-job-ftp-backup-restore"
    events              = ["s3:ObjectRestore:Completed"]
  }
  depends_on = [
    aws_lambda_permission.allow_bucket_prod_ftp_backup
  ]
}

