view: activity {
  sql_table_name: `ekoblov-test.dfp.activity_8264`
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: time {
    type: string
    sql: ${TABLE}.Time ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserId ;;
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.AdvertiserId ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.OrderId ;;
  }

  dimension: line_item_id {
    type: number
    sql: ${TABLE}.LineItemId ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: creative_version {
    type: number
    sql: ${TABLE}.CreativeVersion ;;
  }

  dimension: creative_size {
    type: string
    sql: ${TABLE}.CreativeSize ;;
  }

  dimension: ad_unit_id {
    type: number
    sql: ${TABLE}.AdUnitId ;;
  }

  dimension: custom_targeting {
    type: string
    sql: ${TABLE}.CustomTargeting ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.Domain ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.CountryId ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.Country ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.RegionId ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: metro_id {
    type: number
    sql: ${TABLE}.MetroId ;;
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.Metro ;;
  }

  dimension: city_id {
    type: number
    sql: ${TABLE}.CityId ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: postal_code_id {
    type: number
    sql: ${TABLE}.PostalCodeId ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: browser_id {
    type: number
    sql: ${TABLE}.BrowserId ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.Browser ;;
  }

  dimension: osid {
    type: number
    sql: ${TABLE}.OSId ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.OS ;;
  }

  dimension: band_width {
    type: string
    sql: ${TABLE}.BandWidth ;;
  }

  dimension: audience_segment_ids {
    type: string
    sql: ${TABLE}.AudienceSegmentIds ;;
  }

  dimension: requested_ad_unit_sizes {
    type: string
    sql: ${TABLE}.RequestedAdUnitSizes ;;
  }

  dimension: bandwidth_group_id {
    type: number
    sql: ${TABLE}.BandwidthGroupId ;;
  }

  dimension: mobile_device {
    type: string
    sql: ${TABLE}.MobileDevice ;;
  }

  dimension: osversion {
    type: string
    sql: ${TABLE}.OSVersion ;;
  }

  dimension: mobile_capability {
    type: string
    sql: ${TABLE}.MobileCapability ;;
  }

  dimension: mobile_carrier {
    type: string
    sql: ${TABLE}.MobileCarrier ;;
  }

  dimension: is_companion {
    type: yesno
    sql: ${TABLE}.IsCompanion ;;
  }

  dimension: publisher_provided_id {
    type: string
    sql: ${TABLE}.PublisherProvidedID ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.DeviceCategory ;;
  }

  dimension: is_interstitial {
    type: yesno
    sql: ${TABLE}.IsInterstitial ;;
  }

  dimension: gfp_activity_id {
    type: number
    sql: ${TABLE}.GfpActivityId ;;
  }

  dimension: gfp_activity_name {
    type: string
    sql: ${TABLE}.GfpActivityName ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: ord {
    type: string
    sql: ${TABLE}.Ord ;;
  }

  dimension: revenue_int {
    type: number
    sql: ${TABLE}.Revenue ;;
  }

  dimension: revenue {
    type: number
    sql: CAST(${revenue_int} as FLOAT64) ;;
  }

  dimension: referer_url {
    type: string
    sql: ${TABLE}.RefererURL ;;
  }

  dimension: _latest_date {
    type: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: _data_date {
    type: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }

  set: detail {
    fields: [
      time,
      user_id,
      advertiser_id,
      order_id,
      line_item_id,
      creative_id,
      creative_version,
      creative_size,
      ad_unit_id,
      custom_targeting,
      domain,
      country_id,
      country,
      region_id,
      region,
      metro_id,
      metro,
      city_id,
      city,
      postal_code_id,
      postal_code,
      browser_id,
      browser,
      osid,
      os,
      band_width,
      audience_segment_ids,
      requested_ad_unit_sizes,
      bandwidth_group_id,
      mobile_device,
      osversion,
      mobile_capability,
      mobile_carrier,
      is_companion,
      publisher_provided_id,
      device_category,
      is_interstitial,
      gfp_activity_id,
      gfp_activity_name,
      quantity,
      ord,
      revenue,
      referer_url,
      _latest_date,
      _data_date
    ]
  }
}
