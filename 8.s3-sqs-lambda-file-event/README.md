# s3-sqs-lambda-file-event

In this example I build 1 s3 bucket, 1 SQS queue and 1 lambda. Whenever a file is uploaded to the s3 bucket and event is generated to the SQS queue, then those events will be received in the lambda and processed further.

## Installation

### Step 1
1. Init and download provider
```
$ terraform init
```

### Step 2
2. Provision the resources
```
$ terraform apply
```

### Step 3
3. Destroy
```
$ terraform destroy
```


### Pictures
<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/217998971-3389ceb5-2f91-4417-b35e-eed6ae725068.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/217998982-72bb2a2e-6521-4751-b0a7-a161a5187a47.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="">
    </td>
    <td>
  	<img width="450" alt="Image" src="">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="">
    </td>
  </tr>
</table>
