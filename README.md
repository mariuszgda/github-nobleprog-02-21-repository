# Full project

See page 34

## Usage

```bash
terraform apply -var-file=dev.tfvars
terraform apply -var-file=prod.tfvars
```

## Info

* Dev
  * region: eu-west-1
  * VPC: 192.168.1.0/24
  * two subnets: 192.168.1.0/26, 192.168.1.64/26
* Prod
  * region: us-east-1
  * VPC: 192.168.2.0/24
  * two subnet: 192.168.2.0/26, 192.168.2.64/26
