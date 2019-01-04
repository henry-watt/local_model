view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  dimension: case_eg {
      case: {
        when: {
          sql:{rank} = 1;;
          label: "Number 1"
        }
        else: "Not Number 1"
      }
  }

  dimension: tier_eg {
    type:  tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
    style: classic
    sql:  ${TABLE}.rank;;
  }

  dimension: cheap_or_nat {
    type:  yesno
    sql: ${retail_price} < 20;;
  }

  measure: min_eg {
    type: min
    sql: ${retail_price} ;;
  }

  measure: average_example {
    type: average
    sql: ${retail_price}
    drill_fields: ${retail_price};;
  }

  measure: sum_eg {
    type: sum
    sql: ${retail_price} ;;
  }

  measure: number_eg {
    type: number
    sql: ${retail_price} - ${retail_price} ;;
  }

  measure: median_retail {
    type: median
    sql: ${retail_price}
    value_format_name: usd;;
  }
}
