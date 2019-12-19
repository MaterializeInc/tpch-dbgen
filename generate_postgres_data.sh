declare -a arr=("customer" "lineitem" "nation" "orders" "part" "partsupp" "region" "supplier")

for i in "${arr[@]}"
do
  if [ -f "postgres_$i.tbl" ]; then
    echo "Removing old postgres_$i.tbl"
    rm "postgres_$i.tbl"
  fi

  echo "Translating $i.tbl into postgres file postgres_$i.tbl"
  # To import data into PostgreSQL, remove the trailing | delimiter used for MySQL.
  sed 's/.$//' "$i.tbl" > "postgres_$i.tbl"
done
