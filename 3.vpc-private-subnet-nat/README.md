# vpc-private-subnet-nat

In this example I build 1 VPC with 1 public subnet (1 EC2 instance inside), 1 private subnet (1 EC2 instance inside), 1 Internet Gateway in the VPC and 1 NAT gateway for allowing internet access for the private subnet through the IGW. Both EC2 instances have internet access and SSH connection permission with key pairs.

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
  		<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851490-78e3f390-2fe6-489f-ab91-45452e5ac1bc.png">
	  </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851495-d658dff0-a1bb-4184-bcbe-6ad066f28fe0.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  		<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851501-f4e53da5-da3a-44af-bd82-3ba574246319.png">
	  </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851507-22ee4de9-2b8e-4d36-bd4f-f01ecf862d5d.png">
    </td>
  </tr>
</table>

<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851517-b14bd932-fcea-407a-9d47-7f0a434d7afa.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851522-3f4cead6-288a-4c56-a2d1-835ca3b6b710.png">
    </td>
  </tr>
</table>

<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851530-e849a0e6-8dce-4316-93db-942b57e1f995.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851536-62688d12-66d7-4541-9fcd-69b1fccd900b.png">
    </td>
  </tr>
</table>

<table style="width:100%">
  <tr>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851642-7129958e-8371-4ef4-8c11-0c294aaa2c70.png">
    </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216851733-6aabad1d-9d88-4396-ba44-4bae743f8f31.png">
    </td>
  </tr>
</table>





