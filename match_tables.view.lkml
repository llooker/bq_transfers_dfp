view: match_table_ad_unit {
  sql_table_name:`ekoblov-test.dfp.MatchTableAdUnit_8264` ;;

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

# view: match_table_company {
#   sql_table_name: `ekoblov-test.dfp.MatchTableCompany_8264` ;;
#
#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.Id ;;
#   }
#
#   dimension_group: _data {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}._DATA_DATE ;;
#   }
#
#   dimension_group: _latest {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}._LATEST_DATE ;;
#   }
#
#   dimension: address {
#     type: string
#     sql: ${TABLE}.Address ;;
#   }
#
#   dimension: applied_labels {
#     hidden: yes
#     sql: ${TABLE}.AppliedLabels ;;
#   }
#
#   dimension: applied_team_ids {
#     type: number
#     sql: ${TABLE}.AppliedTeamIds ;;
#   }
#
#   dimension: comment {
#     type: string
#     sql: ${TABLE}.Comment ;;
#   }
#
#   dimension: credit_status {
#     type: string
#     sql: ${TABLE}.CreditStatus ;;
#   }
#
#   dimension: email {
#     type: string
#     sql: ${TABLE}.Email ;;
#   }
#
#   dimension: external_id {
#     type: string
#     sql: ${TABLE}.ExternalId ;;
#   }
#
#   dimension: fax_phone {
#     type: string
#     sql: ${TABLE}.FaxPhone ;;
#   }
#
#   dimension_group: last_modified_date {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.LastModifiedDateTime ;;
#   }
#
#   dimension: name {
#     type: string
#     sql: ${TABLE}.Name ;;
#   }
#
#   dimension: primary_contact_id {
#     type: number
#     sql: ${TABLE}.PrimaryContactId ;;
#   }
#
#   dimension: primary_phone {
#     type: string
#     sql: ${TABLE}.PrimaryPhone ;;
#   }
#
#   dimension: third_party_company_id {
#     type: number
#     sql: ${TABLE}.ThirdPartyCompanyId ;;
#   }
#
#   dimension: type {
#     type: string
#     sql: ${TABLE}.Type ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [id, name]
#   }
# }

view: match_table_user {
    sql_table_name: `ekoblov-test.dfp.match_table_user_8264` ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.ExternalId ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: CAST(${TABLE}.Id as STRING) ;;
  }

  dimension: is_service_account {
    type: string
    sql: ${TABLE}.IsServiceAccount ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: role_id {
    type: string
    sql: ${TABLE}.RoleId ;;
  }

  dimension: role_name {
    type: string
    sql: ${TABLE}.RoleName ;;
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
      email,
      external_id,
      id,
      is_service_account,
      name,
      role_id,
      role_name,
      _latest_date,
      _data_date
    ]
  }
}


view: match_table_line_items {
  sql_table_name: `ekoblov-test.dfp.line_item_8264` ;;
  ## table syntax should be dataset.matchtablelineitem

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
