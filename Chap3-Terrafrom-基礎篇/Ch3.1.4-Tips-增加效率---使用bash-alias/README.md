# Terraform tip

1. 打開終端機中的 .bashrc or .zshrc 檔案
2. 在文件最下方加入下列指令
3. 執行 source ~/.zshrc 或是 source ~/.bashrc 讓下面的 alias 快捷鍵生效

```BASH
alias tf="terraform"
alias tfv="terraform validate"
alias tfdp="terraform apply -auto-approve plan.out"
alias tfd="terraform apply -auto-approve"
alias tfr="terraform destroy -auto-approve"
alias tfp="terraform plan -out plan.out"
```
