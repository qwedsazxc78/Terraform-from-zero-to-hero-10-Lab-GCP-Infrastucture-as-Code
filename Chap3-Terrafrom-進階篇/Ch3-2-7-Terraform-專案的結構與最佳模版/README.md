## Terraform init environment

```BASH
sh init-cmd.sh
# it sync the state from gitlab (connect to vpn)
terraform init
```


## Terraform check

```BASH
terraform fmt
terraform validate
```

## Terraform plan and deploy

```BASH
terraform plan -out plan.out
terraform apply -auto-approve plan.out
```

## Terraform destroy

```BASH
terraform destroy -auto-approve
```

## Terraform alias in your .bashrc or .zshrc

```BASH
alias tf="terraform"
alias tfv="terraform validate"
alias tfdp="terraform apply -auto-approve plan.out"
alias tfd="terraform apply -auto-approve"
alias tfr="terraform destroy -auto-approve"
alias tfp="terraform plan -out plan.out"
```
