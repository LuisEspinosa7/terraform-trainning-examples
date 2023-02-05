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
    <td>
  	<img width="450" alt="Image" src="">
    </td>
  </tr>
</table>
