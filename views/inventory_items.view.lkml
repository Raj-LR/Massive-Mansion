view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }



  parameter: date_granularity {
    view_label: "Advanced Filters"
    type: unquoted
    allowed_value: { value: "Day" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }


  dimension: completed_date_dynamic {
    view_label: "Advanced Filters"
    type: date
    label_from_parameter: date_granularity
    #required_access_grants: [can_use_advanced_filters]
    description: "To enable dynamic filtering. To be used in data section as selected field in conjunction with completed date as a filter."
    sql:
          {%  if date_granularity._parameter_value == 'Day'%}  ${created_date}
           {% elsif date_granularity._parameter_value== 'Week'%}  ${created_week}
          {% elsif date_granularity._parameter_value == 'Month'%}  ${created_month}
          {% elsif date_granularity._parameter_value == 'Quarter'%}  ${created_quarter}
           {% elsif date_granularity._parameter_value == 'Year'%}  CONVERT(VARCHAR,${created_year})
          {% else %} NULL
          {% endif %} ;;

    }
  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name, order_items.count]
  }
}
