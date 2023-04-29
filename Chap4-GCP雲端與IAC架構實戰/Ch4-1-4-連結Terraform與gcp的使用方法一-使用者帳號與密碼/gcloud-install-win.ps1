#######################################################
# 0. python3 安裝 (建議使用方法)
#######################################################
# 下載python3.5-3.9的版本，執行安裝
# gcloud sdk 限定python的版本
https://www.python.org/downloads/

#######################################################
# 1. powershell 安裝 (建議使用方法)
#######################################################
(New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")
& $env:Temp\GoogleCloudSDKInstaller.exe

#######################################################
# 2. 或使用下載後安裝 (1或2挑選一種方式即可)
#######################################################
# https://cloud.google.com/sdk/docs/install-sdk
# 先到上面的網站，下載安裝對應的壓縮檔案
https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe
# 下載後，執行安裝

#######################################################
# 無論方法一或是方法二，安裝完都需要測試gcloud是否完成
#######################################################
gcloud version

# 應該出現類似下列版本
Google Cloud SDK 427.0.0
beta 2023.04.17
bq 2.0.91
core 2023.04.17
gcloud-crc32c 1.0.0
gke-gcloud-auth-plugin 0.5.2
gsutil 5.23
kubectl 1.24.12

#######################################################
# gcloud init 設定環境
#######################################################
# 根據官方文件的連結，一步一步設定
# https://cloud.google.com/sdk/docs/install-sdk#initializing_the
gcloud init

#######################################################
# gcloud auth 得到權限
#######################################################」
gcloud auth application-default login
