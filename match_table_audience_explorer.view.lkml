view: match_table_audience_explorer {
  sql_table_name: (SELECT * FROM `ekoblov-test.dfp.MatchTableAudienceExplorer_8264` WHERE _DATA_DATE=_LATEST_DATE) ;;

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
    convert_tz: no
    sql: ${TABLE}._DATA_DATE ;;
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
    sql: ${TABLE}._LATEST_DATE ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
