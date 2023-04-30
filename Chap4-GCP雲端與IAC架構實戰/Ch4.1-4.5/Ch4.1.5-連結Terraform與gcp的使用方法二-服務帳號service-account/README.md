# Terraform tip

執行專案

```BASH
terraform validate
terraform plan -out plan.out
terraform apply -auto-approve plan.out
```

快捷鍵

```BASH
alias tf="terraform"
alias tfv="terraform validate"
alias tfdp="terraform apply -auto-approve plan.out"
alias tfd="terraform apply -auto-approve"
alias tfr="terraform destroy -auto-approve"
alias tfp="terraform plan -out plan.out"
```
