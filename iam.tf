###
### IAM Role for Lambda Function 'aws-lambda-run-jenkins-job-ftp-backup-restore' ###
###
data "aws_iam_policy_document" "aws-lambda-run-jenkins-job-ftp-backup-restore" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "run-jenkins-job-ftp-backup-restore" {
  name               = "aws-lambda-run-jenkins-job-ftp-backup-restore"
  description        = "Role used for by the aws lambda function 'aws-lambda-run-jenkins-job-ftp-backup-restore' to monitor S3 restore status and trigger jenkins job"
  assume_role_policy = data.aws_iam_policy_document.aws-lambda-run-jenkins-job-ftp-backup-restore.json
}