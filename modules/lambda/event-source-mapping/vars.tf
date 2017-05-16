/**
 * Required Variables.
 */

variable "aws" {
  type        = "map"
  description = "AWS account informations."
}

variable "project" {
  description = "Name of project"
}

variable "environment" {
  description = "Name of environment (i.e. dev, test, prod)"
}

variable "event_source_arn" {
  description = "The event source ARN - can either be a Kinesis or DynamoDB stream."
}

variable "function_name" {
  description = "The name of the Lambda function that will be subscribing to events."
}

variable "function_alias" {
  description = "The alias of the Lambda function that will be subscribing to events."
}

/**
 * Optional Variables.
 */

variable "batch_size" {
  description = "The largest number of records that Lambda will retrieve from your event source at the time of invocation."
  default     = "100"
}

variable "enabled" {
  description = "Determines if the mapping will be enabled on creation."
  default     = "true"
}

variable "starting_position" {
  description = "The position in the stream where AWS Lambda should start reading. Can be one of either TRIM_HORIZON or LATEST."
  default     = "TRIM_HORIZON"
}
