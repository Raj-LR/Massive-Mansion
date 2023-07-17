view: payment {
  sql_table_name: public.payment ;;
  drill_fields: [payment_id]

  dimension: payment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."payment_id" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."customer_id" ;;
  }

  dimension_group: payment {
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
    sql: ${TABLE}."payment_date" ;;
  }

  dimension: rental_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."rental_id" ;;
  }

  dimension: staff_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."staff_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      payment_id,
      rental.rental_id,
      staff.username,
      staff.last_name,
      staff.first_name,
      staff.staff_id,
      customer.last_name,
      customer.first_name,
      customer.customer_id
    ]
  }
}
