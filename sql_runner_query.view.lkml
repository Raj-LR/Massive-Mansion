view: sql_runner_query {
  derived_table: {
    sql: SELECT
          (DATE_FORMAT(CONVERT_TZ(`inventory_items`.`created_at`,'UTC','America/Los_Angeles'),'%Y-%m')) AS `inventory_items.created_month`,
          COUNT(DISTINCT products.id ) AS `products.count`
      FROM
          `demo_db`.`inventory_items` AS `inventory_items`
          LEFT JOIN `demo_db`.`products` AS `products` ON `inventory_items`.`product_id` = `products`.`id`
      GROUP BY
          1
      ORDER BY
          (DATE_FORMAT(CONVERT_TZ(`inventory_items`.`created_at`,'UTC','America/Los_Angeles'),'%Y-%m')) DESC
      LIMIT 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: inventory_items_created_month {
    type: string
    sql: ${TABLE}.`inventory_items.created_month` ;;
  }

  dimension: products_count {
    type: number
    sql: ${TABLE}.`products.count` ;;
  }

  set: detail {
    fields: [inventory_items_created_month, products_count]
  }
}
