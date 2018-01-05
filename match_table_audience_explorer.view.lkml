view: match_table_audience_explorer {
  sql_table_name:`ekoblov-test.dfp.MatchTableAudienceExplorer_82109981` ;;

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
    hidden: yes
    sql: ${TABLE}.ThirtyDayActiveSize ;;
  }

  dimension: thirty_day_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.ThirtyDayClicks ;;
  }

  dimension: thirty_day_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.ThirtyDayImpressions ;;
  }

  measure: total_thirty_day_active_size {
    type: max
    sql: ${thirty_day_active_size};;
  }

  measure: total_thirty_day_clicks {
    type: max
    sql: ${thirty_day_clicks} ;;
  }

  measure: total_thirty_day_impressions {
    type: max
    sql: ${thirty_day_impressions} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
