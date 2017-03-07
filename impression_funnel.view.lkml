view: impression_funnel {
  derived_table: {
    sql: select user_impression_metrics.*
                  , first_click
                  , latest_click
                  , count_clicks
                  , first_activity
                  , latest_activity
                  , revenue
            from
            (select userid
                , orderid
                , adunitid
                , lineitemid
                , min(postalcode) as zip_code
                , min(region) as state_region
                , min(countryid) as country_code
                , min(time) as first_impression
                , max(time) as latest_impression
                , count(*) as count_impressions
            from `ekoblov-test.dfp.impression_8264`
            where userid <> '' and userid is not null
            group by 1,2,3,4) as user_impression_metrics

            left join

            (select userid
                , orderid
                , adunitid
                , lineitemid
                , min(time) as first_click
                , max(time) as latest_click
                , count(*) as count_clicks
            from `ekoblov-test.dfp.click_8264`
            where userid <> '' and userid is not null
            group by 1,2,3,4) as user_click_metrics

            on user_impression_metrics.userid = user_click_metrics.userid
            and user_impression_metrics.orderid = user_click_metrics.orderid
            and user_impression_metrics.adunitid = user_click_metrics.adunitid
            and user_impression_metrics.lineitemid = user_click_metrics.lineitemid


            left join

            (select  userid
                , orderid
                , adunitid
                , lineitemid
                , min(time) as first_activity
                , max(time) as latest_activity
                , sum(CAST(revenue as FLOAT64)) as revenue
                from `ekoblov-test.dfp.activity_8264`
                where UserID <> '' and UserID is not null
                group by 1,2,3,4) as user_activity_metrics
            on user_impression_metrics.userid = user_activity_metrics.userid
            and user_impression_metrics.orderid = user_activity_metrics.orderid
            and user_impression_metrics.adunitid = user_activity_metrics.adunitid
            and user_impression_metrics.lineitemid = user_activity_metrics.lineitemid
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: userid {
    type: string
    sql: ${TABLE}.userid ;;
  }

  dimension: orderid {
    type: number
    sql: ${TABLE}.orderid ;;
  }

  dimension: adunitid {
    type: number
    sql: ${TABLE}.adunitid ;;
  }

  dimension: lineitemid {
    type: number
    sql: ${TABLE}.lineitemid ;;
  }

  dimension: zip_code {
    type: string
    sql: ${TABLE}.zip_code ;;
  }

  dimension: state_region {
    type: string
    sql: ${TABLE}.state_region ;;
  }

  dimension: country_code {
    type: number
    sql: ${TABLE}.country_code ;;
  }

  dimension: first_impression {
    type: string
    sql: ${TABLE}.first_impression ;;
  }

  dimension: latest_impression {
    type: string
    sql: ${TABLE}.latest_impression ;;
  }

  dimension: count_impressions {
    type: number
    sql: ${TABLE}.count_impressions ;;
  }

  dimension: first_click {
    type: string
    sql: ${TABLE}.first_click ;;
  }

  dimension: latest_click {
    type: string
    sql: ${TABLE}.latest_click ;;
  }

  dimension: count_clicks {
    type: number
    sql: ${TABLE}.count_clicks ;;
  }

  dimension: first_activity {
    type: string
    sql: ${TABLE}.first_activity ;;
  }

  dimension: latest_activity {
    type: string
    sql: ${TABLE}.latest_activity ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

 measure: total_impressions {
   type:sum
   sql: ${count_impressions} ;;
   value_format_name: decimal_0
 }

  measure: total_clicks {
    type:sum
    sql: ${count_clicks} ;;
    value_format_name: decimal_0
  }

  measure: total_revenue {
    type:sum
    sql: ${revenue} ;;
    value_format_name: decimal_0
  }

  set: detail {
    fields: [
      userid,
      orderid,
      adunitid,
      lineitemid,
      zip_code,
      state_region,
      country_code,
      first_impression,
      latest_impression,
      count_impressions,
      first_click,
      latest_click,
      count_clicks,
      first_activity,
      latest_activity,
      revenue
    ]
  }
}
