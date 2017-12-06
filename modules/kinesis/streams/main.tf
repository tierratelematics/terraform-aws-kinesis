/**
 * Resources.
 */

terraform {
  required_version = ">= 0.9"
}

resource "aws_kinesis_stream" "kinesis-stream" {
  name        = "${format("%s-%s-%s-stream", var.project, var.environment, var.name)}"
  shard_count = "${var.shard_count}"

  retention_period    = "${var.retention_period}"
  shard_level_metrics = "${var.shard_level_metrics}"

  tags {
    Name        = "${format("%s-%s-%s-stream", var.project, var.environment, var.name)}"
    Project     = "${var.project}"
    Environment = "${var.environment}"
  }
}
