view: match_table_audience_segment {
  sql_table_name: dfp.MatchTableAudienceSegment_82109981 ;;

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
    sql: timestamp(${TABLE}._LATEST_DATE) ;;
  }

  dimension: category_ids {
    type: number
    sql: ${TABLE}.CategoryIds ;;
    fanout_on: "CategoryIds"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: owner_account_id {
    type: number
    sql: ${TABLE}.OwnerAccountId ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.OwnerName ;;
  }

  dimension: segment_type {
    type: string
    sql: ${TABLE}.SegmentType ;;
  }

  measure: count {
    type: count
    drill_fields: [id, owner_name, name]
  }
}
