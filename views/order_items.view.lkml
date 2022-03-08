include: "/views/inventory_items.view.lkml"
view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    suggest_explore: inventory_items
    suggest_dimension: inventory_items.id
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }
parameter: yes_no {
  type: unquoted
  allowed_value: {
    value: "Yes"
  }
  allowed_value: {
    value: "No"
  }
}
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format: "0.0,, 'M'"
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
