resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true


  tags = {
    Name = "Jenkins Bucket"
  }
}


resource "aws_s3_object" "object-txt" {
  bucket = aws_s3_bucket.frontend.id
  key    = "Armageddon-Proof/armageddon-link.txt"
  source = "${path.module}/Armageddon-Proof/armageddon-link.txt"
}

resource "aws_s3_object" "object-png" {
  bucket = aws_s3_bucket.frontend.id
  key    = "Armageddon-Proof/passing.png"
  source = "${path.module}/Armageddon-Proof/passing.png"
}

resource "aws_s3_object" "object-png-2" {
  bucket = aws_s3_bucket.frontend.id
  key    = "Armageddon-Proof/lab-evidence.png"
  source = "${path.module}/Armageddon-Proof/lab-evidence.png"
}