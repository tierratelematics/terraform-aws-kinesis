# terraform-aws-kinesis

This repository is a set of Terraform modules for configuring Amazon Kinesis Stream resources. 

## Quickstart

The easiest way to get the modules and running is by creating a Terraform definition for it, copy this snippet in a file
named `main.tf`:

```hcl
module "inbound-kinesis-stream" {
  source = "git::https://github.com/tierratelematics/terraform-aws-kinesis.git//modules/kinesis/streams"

  environment = "${var.environment}"
  project     = "${var.project}"
  name        = "my-inbound-stream"
  shard_count = "1"
}
```

You can process the records in the stream using a Lambda function.

```hcl
module "stream-to-lambda" {
  source = "git::https://github.com/tierratelematics/terraform-aws-kinesis.git//modules/lambda/event-source-mapping"

  aws         = "${var.aws}"
  environment = "${var.environment}"
  project     = "${var.project}"

  event_source_arn = "${module.inbound-kinesis-stream.arn}"
  function_name    = "get_records"
  function_alias   = "${var.lambda_get_records_alias}}"
}
```

### AWS Lambda Function

Here you can find some sample TypeScript code of a Lambda function that pulls records from a Kinesis stream.

```typescript
export function handler(event: KinesisStreamsEvent, context: Context): Promise<void> {
    try {

        event.Records.forEach(record => {

            let payload = new Buffer(record.kinesis.data, 'base64').toString('utf8');

            console.log(`payload (decoded): ${payload}`)
        });

        context.done();
    }
    catch (reason) {
        context.fail(reason);
    }
}
```

This is the structure of the `KinesisStreamsEvent` object.

```typescript
interface KinesisStreamsEvent {
    Records: [
        {
            eventID: string,
            eventVersion: string,
            kinesis: {
                approximateArrivalTimestamp: number,
                partitionKey: number,
                data: string,
                kinesisSchemaVersion: string,
                sequenceNumber: string
            },
            invokeIdentityArn: string,
            eventName: string,
            eventSourceARN: string,
            eventSource: string,
            awsRegion: string
        }
        ]
}

```

## License

Copyright 2017 Tierra SpA

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.