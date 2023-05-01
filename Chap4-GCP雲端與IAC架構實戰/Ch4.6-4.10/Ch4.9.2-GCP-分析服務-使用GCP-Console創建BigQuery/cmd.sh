# bq load --project_id=example-project \
#   example_dataset.example_table \
#   data \
#   schema

# 上傳資料
bq load --project_id=terraform101-384507 \
    bq_tf_ch4_9_2.example_table \
    data.txt \
    name:string,age:integer

# 查詢資料
bq show bq_tf_ch4_9_2.example_table

bq query "SELECT name,age FROM bq_tf_ch4_9_2.example_table LIMIT 5"