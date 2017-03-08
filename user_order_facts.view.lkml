view: user_order_facts {
  derived_table: {
    sql_trigger_value: SELECT COUNT(*) FROM ${impression_funnel.SQL_TABLE_NAME} ;;
    sql: SELECT
        impression_funnel.user_id AS impression_funnel_user_id,
        impression_funnel.campaign_id AS impression_funnel_order_id,
        min(impression_funnel.first_activity) AS first_campaign_activity_date,
        min(impression_funnel.first_click) AS first_campaign_click_date,
        min(impression_funnel.first_impression) AS first_campaign_impression_date,
        max(impression_funnel.latest_click) AS latest_campaign_click_date,
        max(impression_funnel.latest_activity) AS latest_campaign_activity_date,
        max(impression_funnel.latest_impression) AS latest_campaign_impression_date
      FROM ${impression_funnel.SQL_TABLE_NAME} AS impression_funnel

      GROUP BY 1,2
       ;;
  }

  dimension: user_id {
    type: string
    hidden: yes
    sql: ${TABLE}.impression_funnel_user_id ;;
  }

  dimension: order_id {
    type: string
    hidden: yes
    sql: ${TABLE}.impression_funnel_campaign_id ;;
  }

  dimension_group: first_campaign_activity {
    type: time
    datatype: epoch
    sql: cast(${TABLE}.first_campaign_activity_date/1000000 as int64) ;;
    timeframes: [date, week, month, year]
  }

  dimension_group: first_campaign_click {
    type: time
    datatype: epoch
    sql: cast(${TABLE}.first_campaign_click_date/1000000 as int64) ;;
    timeframes: [date, week, month, year]
  }

  dimension_group: first_campaign_impression {
    type: time
    datatype: epoch
    sql: cast(${TABLE}.first_campaign_impression_date/1000000 as int64) ;;
    timeframes: [date, week, month, year]
  }

  dimension_group: latest_campaign_click {
    type: time
    datatype: epoch
    sql: cast(${TABLE}.latest_campaign_click_date/1000000 as int64) ;;
    timeframes: [date, week, month, year]
  }

  dimension_group: latest_campaign_activity {
    type: time
    datatype: epoch
    sql: cast(${TABLE}.latest_campaign_activity_date/1000000 as int64) ;;
    timeframes: [date, week, month, year]
  }

  dimension_group: latest_campaign_impression {
    type: time
    datatype: epoch
    sql: cast(${TABLE}.latest_campaign_impression_date/1000000 as int64) ;;
    timeframes: [date, week, month, year]
  }

  set: detail {
    fields: [first_campaign_activity_date, first_campaign_click_date, first_campaign_impression_date, latest_campaign_click_date, latest_campaign_activity_date, latest_campaign_impression_date]
  }
}
