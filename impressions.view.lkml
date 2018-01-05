view: impressions {
  sql_table_name: `ekoblov-test.dfp.impression_8264`
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
    type: zipcode
    map_layer_name: us_zipcode_tabulation_areas
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

  dimension: os_version {
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

  dimension: product {
    type: string
    sql: ${TABLE}.Product ;;
  }

  dimension: is_companion {
    type: yesno
    sql: ${TABLE}.IsCompanion ;;
  }

  dimension: publisher_provided_id {
    type: string
    sql: ${TABLE}.PublisherProvidedID ;;
  }

  dimension: gfp_content_id {
    type: number
    sql: ${TABLE}.GfpContentId ;;
  }

  dimension: video_position {
    type: number
    sql: ${TABLE}.VideoPosition ;;
  }

  dimension: pod_position {
    type: number
    sql: ${TABLE}.PodPosition ;;
  }

  dimension: video_fallback_position {
    type: number
    sql: ${TABLE}.VideoFallbackPosition ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.DeviceCategory ;;
  }

  dimension: is_interstitial {
    type: yesno
    sql: ${TABLE}.IsInterstitial ;;
  }

  dimension: active_view_eligible_impression {
    type: string
    sql: ${TABLE}.ActiveViewEligibleImpression ;;
  }

  dimension: key_part {
    type: string
    sql: ${TABLE}.KeyPart ;;
  }

  dimension: referer_url {
    type: string
    sql: ${TABLE}.RefererURL ;;
  }

  dimension: _latest_date {
    type: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension_group: impression {
    type: time
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [country,users,count_ads]
  }

  measure: count_ads {
    type: count_distinct
    sql: ${ad_unit_id} ;;
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
      os_version,
      mobile_capability,
      mobile_carrier,
      product,
      is_companion,
      publisher_provided_id,
      gfp_content_id,
      video_position,
      pod_position,
      video_fallback_position,
      device_category,
      is_interstitial,
      active_view_eligible_impression,
      key_part,
      referer_url,
      _latest_date    ]
  }
}
