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
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275277-0ed7def1-3def-4714-ba5f-78b9b5248c33.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275283-09998ffb-e886-41ac-a1ae-d71d0cfc1f93.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275290-d8e8f228-3717-42b6-a8c9-da3915ba20db.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275293-382a3f7d-5724-49e3-921c-a4206c80ac11.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275299-ba242e00-cf85-4617-a49f-042788b60e09.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275317-e7f407de-bcb3-41ca-94b2-3a6d7f64604a.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275306-39225d5e-3aea-499b-934d-b5e5f557e456.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275311-95b97566-ef20-44a4-af9c-f79ff0e15a5d.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218275306-39225d5e-3aea-499b-934d-b5e5f557e456.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/218278322-5e52bce5-8593-41e2-89ce-edabc8c2847a.png">
    </td>
  </tr>
</table>


### Video

https://youtu.be/DR00oPC8MpQ
