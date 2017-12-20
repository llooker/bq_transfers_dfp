view: match_table_audience_explorer {
  sql_table_name: (SELECT * FROM `ekoblov-test.dfp.MatchTableAudienceExplorer_82109981` WHERE _DATA_DATE=_LATEST_DATE) ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: timestamp(${TABLE}._DATA_DATE) ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: timestamp( ${TABLE}._LATEST_DATE) ;;
  }

  dimension: thirty_day_active_size {
    type: number
    sql: ${TABLE}.ThirtyDayActiveSize/2 ;;
  }

  dimension: thirty_day_clicks {
    type: number
    sql: ${TABLE}.ThirtyDayClicks/2 ;;
  }

  dimension: thirty_day_impressions {
    type: number
    sql: ${TABLE}.ThirtyDayImpressions/2 ;;
  }

  measure: total_thirty_day_active_size {
    type: sum
    sql: ${thirty_day_active_size};;
  }

  measure: total_thirty_day_clicks {
    type: sum
    sql: ${thirty_day_clicks} ;;
  }

  measure: total_thirty_day_impressions {
    type: sum
    sql: ${thirty_day_impressions} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
