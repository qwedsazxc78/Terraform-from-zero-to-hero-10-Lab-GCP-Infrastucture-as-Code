# bq load --project_id=example-project \
#   example_dataset.example_table \
#   data \
#   schema

# 上傳資料
bq load --project_id=terraform101-384507 \
    bq_tf_ch4_lab10.example_table \
    data.txt \
    name:string,age:integer,gender:string

# 查詢資料
bq show bq_tf_ch4_lab10.example_table

bq query "SELECT name, age, gender FROM bq_tf_ch4_lab10.example_table ORDER BY age LIMIT 10"
