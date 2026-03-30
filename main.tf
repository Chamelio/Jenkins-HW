resource "aws_s3_bucket" "s3-jenkins-1" {
  bucket_prefix = "milatinas"
  force_destroy = true


  tags = {
    Name = "Jenkins Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.s3-jenkins-1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "s3_public_access_policy" {
  bucket = aws_s3_bucket.s3-jenkins-1.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3-jenkins-1.arn}/*"
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

resource "aws_s3_object" "object-txt" {
  bucket = aws_s3_bucket.s3-jenkins-1.id
  key    = "Armageddon-Proof/armageddon-link.txt"
  source = "${path.module}/Armageddon-Proof/armageddon-link.txt"
}

resource "aws_s3_object" "object-png" {
  bucket = aws_s3_bucket.s3-jenkins-1.id
  key    = "Armageddon-Proof/passing.png"
  source = "${path.module}/Armageddon-Proof/passing.png"
}

resource "aws_s3_object" "object-jpg" {

  for_each = toset([

    "image1.jpg", "image2.jpeg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg", "image8.jpg", "image9.jpg"
  ])

  bucket       = aws_s3_bucket.s3-jenkins-1.id
  key          = "lab-evidence/${each.value}"
  source       = "${path.module}/lab-evidence/${each.value}"
  content_type = "image/jpeg"
}