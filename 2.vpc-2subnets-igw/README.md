# vpc-2subnets-igw

In this example I build 1 VPC with 2 public subnets (1 EC2 instance on each subnet) and
finally and Internet Gateway for allowing internet access.


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
  		<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216787887-9bb40cb2-5b33-47f9-9c2f-94e1b073d22d.png">
	  </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216787896-abfe65b6-b4ff-430f-9f48-718a02fd0b1c.png">
    </td>
  </tr>
</table>


<table style="width:100%">
  <tr>
    <td>
  		<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216787911-03588fbc-4821-4417-bbbf-beba2b137061.png">
	  </td>
    <td>
  	<img width="450" alt="Image" src="https://user-images.githubusercontent.com/56041525/216788011-b7bee39c-22f7-4971-b2aa-45f176ec4d27.png">
    </td>
  </tr>
</table>
