resource "aws_lambda_permission" "allow_bucket_prod_ftp_backup" {
  statement_id  = "AllowExecutionFromS3BucketProdFTPBackup"
  action        = "lambda:InvokeFunction"
  function_name = "arn:aws:lambda:${var.aws_region}:${var.account_id}:function:run-jenkins-job-ftp-backup-restore"
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.prod-ftp-backup-mende.arn
}