view: match_table_ad_unit {
  sql_table_name: (SELECT * FROM `ekoblov-test.dfp.MatchTableAdUnit_8264` WHERE _LATEST_DATE = _DATA_DATE) ;;

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

  dimension: ad_unit_code {
    type: string
    sql: ${TABLE}.AdUnitCode ;;
  }

  dimension: external_set_top_box_channel_id {
    type: string
    sql: ${TABLE}.ExternalSetTopBoxChannelId ;;
  }

  dimension_group: last_modified_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LastModifiedDateTime ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.ParentId ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.PartnerId ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
