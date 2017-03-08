view: line_items {
  sql_table_name:(SELECT * FROM `ekoblov-test.dfp.line_item_8264` WHERE _data_date = _latest_date)
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.CostType ;;
  }

  dimension_group: creation_date_time {
    type: time
    sql: ${TABLE}.CreationDateTime ;;
  }

  dimension: delivery_rate_type {
    type: string
    sql: ${TABLE}.DeliveryRateType ;;
  }

  dimension_group: end_date_time {
    type: time
    sql: ${TABLE}.EndDateTime ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.ExternalId ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.Id ;;
  }

  dimension: is_missing_creatives {
    type: yesno
    sql: ${TABLE}.IsMissingCreatives ;;
  }

  dimension: is_set_top_box_enabled {
    type: yesno
    sql: ${TABLE}.IsSetTopBoxEnabled ;;
  }

  dimension_group: last_modified_date_time {
    type: time
    sql: ${TABLE}.LastModifiedDateTime ;;
  }

  dimension: line_item_type {
    type: string
    sql: ${TABLE}.LineItemType ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.OrderId ;;
  }

  dimension_group: start_date_time {
    type: time
    sql: ${TABLE}.StartDateTime ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

#   dimension: targeting {
#     type: string
#     sql: ${TABLE}.Targeting ;;
#   }

  dimension: units_bought {
    type: number
    sql: ${TABLE}.UnitsBought ;;
  }

  dimension: _latest_date {
    type: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: _data_date {
    type: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  set: detail {
    fields: [
      cost_type,
      creation_date_time_time,
      delivery_rate_type,
      end_date_time_time,
      external_id,
      id,
      is_missing_creatives,
      is_set_top_box_enabled,
      last_modified_date_time_time,
      line_item_type,
      name,
      order_id,
      start_date_time_time,
      status,
#       targeting,
      units_bought,
      _latest_date,
      _data_date
    ]
  }
}
