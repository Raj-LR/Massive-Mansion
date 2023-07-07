connection: "bigquery-public-data-looker-test"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: raj_testing_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: raj_testing_default_datagroup

explore: crime_partitioned_1 {}

explore: crime {}

