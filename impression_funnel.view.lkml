view: impression_funnel {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE() ;;


    sql: select user_impression_metrics.*
                  , first_click
                  , latest_click
                  , count_clicks
                  , first_activity
                  , latest_activity
                  , activities
                  , revenue
            from
            (select userid
                , orderid
                , adunitid
                , lineitemid
                , Domain
                , CreativeID
                , _data_date
                , AdvertiserId
                , min(postalcode) as zip_code
                , min(region) as state_region
                , min(countryid) as country_code
                , min(time) as first_impression
                , max(time) as latest_impression
                , count(*) as count_impressions
            from `ekoblov-test.dfp.impression_8264`     --may need to swap table name with `NetworkImpressions` depending on your naming convention
            -- where userid <> '' and userid is not null
            group by 1,2,3,4,5,6,7,8) as user_impression_metrics

            left join

            (select userid
                , orderid
                , adunitid
                , lineitemid
                , Domain
                , CreativeID
                , _data_date
                , AdvertiserId
                , min(time) as first_click
                , max(time) as latest_click
                , count(*) as count_clicks
            from `ekoblov-test.dfp.click_8264`  --may need to swap table name with `NetworkClicks` depending on your naming convention
            -- where userid <> '' and userid is not null
            group by 1,2,3,4,5,6,7,8) as user_click_metrics

            on user_impression_metrics.userid = user_click_metrics.userid
            and user_impression_metrics.orderid = user_click_metrics.orderid
            and user_impression_metrics.adunitid = user_click_metrics.adunitid
            and user_impression_metrics.lineitemid = user_click_metrics.lineitemid
            and user_impression_metrics.Domain = user_click_metrics.Domain
            and user_impression_metrics.CreativeID = user_click_metrics.CreativeID
            and user_impression_metrics._data_date = user_click_metrics._data_date
            and user_impression_metrics.AdvertiserId = user_click_metrics.AdvertiserId


            left join

            (select  userid
                , orderid
                , adunitid
                , lineitemid
                , Domain
                , CreativeID
                , _data_date
                , AdvertiserId
                , min(time) as first_activity
                , max(time) as latest_activity
                , sum(CAST(quantity as FLOAT64)) as activities
                , sum(CAST(revenue as FLOAT64)) as revenue
                from `ekoblov-test.dfp.activity_8264`  --may need to swap table name with `NetworkActivities` depending on your naming convention
                -- where UserID <> '' and UserID is not null
                group by 1,2,3,4,5,6,7,8) as user_activity_metrics
            on user_impression_metrics.userid = user_activity_metrics.userid
            and user_impression_metrics.orderid = user_activity_metrics.orderid
            and user_impression_metrics.adunitid = user_activity_metrics.adunitid
            and user_impression_metrics.lineitemid = user_activity_metrics.lineitemid
            and user_impression_metrics.Domain = user_activity_metrics.Domain
            and user_impression_metrics.CreativeID = user_activity_metrics.CreativeID
            and user_impression_metrics._data_date = user_activity_metrics._data_date
            and user_impression_metrics.AdvertiserId = user_activity_metrics.AdvertiserId
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.userid ;;
  }

  dimension_group: event {
    type: time
    timeframes: [date,month,year,day_of_week,week_of_year,month_num]
    sql: TIMESTAMP(${TABLE}._data_date) ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.orderid ;;
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.AdvertiserId ;;
  }

  dimension: ad_unit_id {
    type: number
    sql: ${TABLE}.adunitid ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.lineitemid ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.Domain ;;
    suggestable: yes
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.CreativeID ;;
  }

  dimension: zip_code {
    type: zipcode
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
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.revenue ;;
  }

  dimension: activities {
    type: number
    hidden: yes
    sql: ${TABLE}.activities ;;
  }

  measure: user_count {
   type:count_distinct
   sql: ${user_id} ;;
   value_format_name: decimal_0
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

  measure: click_through_rate {
    type:number
    sql: ${total_clicks}*1.0/(NULLIF(${total_impressions},0)) ;;
    value_format_name: percent_2
  }

  measure: total_revenue {
    type:sum
    sql: ${revenue} ;;
    value_format_name: usd_0
  }

  measure: total_activities {
    type:sum
    description: "The total quantity of an activity occuring. Activities are custom defined, and can represent pageviews, form fills, purchases, or other"
    sql: ${activities} ;;
    value_format_name: decimal_0
  }

  measure: click_to_revenue_conversion {
    type:number
    sql: ${total_revenue}*1.0/(NULLIF(${total_clicks},0)) ;;
    value_format_name: percent_2
  }

  set: detail {
    fields: [
      user_id,
      order_id,
      ad_unit_id,
      line_item_id,
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
