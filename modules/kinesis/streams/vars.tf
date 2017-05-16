/**
 * Required Variables.
 */

variable "project" {
  description = "Name of project"
}

variable "environment" {
  description = "Name of environment (i.e. dev, test, prod)"
}

variable "name" {
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in"
}

variable "shard_count" {
  description = "The number of shards that the stream will use."

  //  Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream.
  //  See [Amazon Kinesis Streams](https://docs.aws.amazon.com/streams/latest/dev/amazon-kinesis-streams.html) for more.
}

/**
 * Optional Variables.
 */

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream."
  default     = "24"

  //  The maximum value of a stream's retention period is 168 hours. Minimum value is 24."
}

variable "shard_level_metrics" {
  type        = "list"
  description = "A list of shard-level CloudWatch metrics which can be enabled for the stream."
  default     = []

  //  See [Monitoring with CloudWatch](https://docs.aws.amazon.com/streams/latest/dev/monitoring-with-cloudwatch.html)
  // for more. Note that the value ALL should not be used; instead you should provide an explicit list of metrics you
  // wish to enable."
}
