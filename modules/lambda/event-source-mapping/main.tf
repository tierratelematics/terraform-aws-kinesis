/**
 * Resources.
 */

terraform {
  required_version = ">= 0.9, < 0.10"
}

resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  event_source_arn  = "${var.event_source_arn}"
  function_name     = "${format("arn:aws:lambda:%s:%s:function:%s_%s:%s", var.aws["region"], var.aws["account_id"], var.project, var.function_name, var.function_alias)}"
  batch_size        = "${var.batch_size}"
  starting_position = "${var.starting_position}"
  enabled           = "${var.enabled}"
}
