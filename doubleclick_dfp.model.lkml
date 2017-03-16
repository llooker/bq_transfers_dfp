connection: "doubleclick"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"



 explore: impression_funnel {
  label: "Impression Funnel"
  view_label: "Impression Funnel"

  join: match_table_ad_unit {
    view_label: "Ad Units"
    sql_on: ${match_table_ad_unit.id} = ${impression_funnel.ad_unit_id} ;;
    relationship: many_to_one
  }
  join: line_items {
    view_label: "Ad Units"
    sql_on: ${line_items.id} = ${impression_funnel.line_item_id} ;;
    relationship: many_to_one
  }
#   join: user_order_facts {
#     view_label: "Users"
#     sql_on: ${impression_funnel.order_id} = ${user_order_facts.order_id} AND ${impression_funnel.user_id} = ${user_order_facts.user_id} ;;
#     relationship: many_to_one
#   }


 }


 explore: impressions {
    label: "Impressions"
    view_label: "Impressions"

    join: match_table_ad_unit {
      view_label: "Ad Units"
      sql_on: ${match_table_ad_unit.id} = ${impressions.ad_unit_id} ;;
      relationship: many_to_one
    }

    join: line_items {
      view_label: "Line Items"
      sql_on: ${line_items.id} = ${impressions.line_item_id} ;;
      relationship:  many_to_one
  }
}

 explore:  clicks {
   label: "Clicks"
   view_label: "Clicks"

    join: match_table_ad_unit {
      view_label: "Ad Units"
      sql_on: ${match_table_ad_unit.id} = ${clicks.ad_unit_id} ;;
      relationship: many_to_one
    }

    join: line_items {
      view_label: "Line Items"
      sql_on: ${line_items.id} = ${clicks.line_item_id} ;;
      relationship:  many_to_one
    }
 }

explore: match_table_audience_explorer {
  label: "Audience Facts"
  view_label: "Audience Facts"

  join: match_table_audience_segment {
    view_label: "Audience Segment"
    sql_on: ${match_table_audience_explorer.id} = ${match_table_audience_segment.id} ;;
    relationship: many_to_one
  }
}


 explore: activity {}
