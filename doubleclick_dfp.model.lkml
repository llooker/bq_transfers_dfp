connection: "doubleclick"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"



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
