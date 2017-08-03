
/**
 * Outputs.
 */

output "arn" {
  value = "${aws_kinesis_stream.kinesis-stream.arn}"
}

output "name" {
  value = "${aws_kinesis_stream.kinesis-stream.name}"
}
