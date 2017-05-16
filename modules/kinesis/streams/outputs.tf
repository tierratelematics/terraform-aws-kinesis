/**
 * Outputs.
 */

output "arn" {
  value = "${aws_kinesis_stream.kinesis-stream.arn}"
}
