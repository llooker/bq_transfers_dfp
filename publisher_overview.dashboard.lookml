- dashboard: publisher_overview
  title: Publisher Overview
  layout: tile
  tile_size: 100

  filters:

  elements:
    - name: total_impressions
      title: Total Impressions
      type: single_value
      model: doubleclick_dfp
      explore: impressions
      measures: [impressions.count]
      sorts: [impressions.count desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      value_format: 0.00,, "M"
      totals_color: "#808080"
      series_types: {}
      height: 1
      width: 4

    - name: total_clicks
      title: Total Clicks
      type: single_value
      model: doubleclick_dfp
      explore: clicks
      measures: [clicks.count]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      value_format: 0.00,, "M"
      single_value_title: Total Clicks
      height: 1
      width: 4

    - name: total_users
      title: Total Users
      type: single_value
      model: doubleclick_dfp
      explore: impressions
      measures: [impressions.users]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      show_null_points: true
      point_style: none
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      value_format: 0.00,, "M"
      totals_color: "#808080"
      series_types: {}
      height: 1
      width: 4

    - name: clicks_by_zipcode
      title: Clicks By Zipcode
      type: looker_geo_coordinates
      model: doubleclick_dfp
      explore: clicks
      dimensions: [clicks.postal_code]
      measures: [clicks.count]
      filters:
        clicks.postal_code: "-NULL"
      sorts: [clicks.count desc]
      limit: '1000'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      map: usa
      map_projection: ''
      show_view_names: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: custom
      map_scale_indicator: 'off'
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_legend: true
      quantize_map_value_colors: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      series_types: {}
      value_format: 0.00,, "M"
      single_value_title: Total Clicks
      map_latitude: 40.762861133145016
      map_longitude: -74.05746459960939
      map_zoom: 10
      height: 5
      width: 6

    - name: users_by_zipcode
      title: Users By Zipcode
      type: looker_geo_coordinates
      model: doubleclick_dfp
      explore: impressions
      dimensions: [impressions.postal_code]
      measures: [impressions.users]
      filters:
        impressions.postal_code: "-NULL"
      sorts: [impressions.count desc]
      limit: '1000'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      map: usa
      map_projection: ''
      show_view_names: true
      map_plot_mode: points
      heatmap_gridlines: false
      heatmap_opacity: 0.5
      show_region_field: true
      draw_map_labels_above_data: true
      map_tile_provider: positron
      map_position: custom
      map_scale_indicator: 'off'
      map_pannable: true
      map_zoomable: true
      map_marker_type: circle
      map_marker_icon_name: default
      map_marker_radius_mode: proportional_value
      map_marker_units: meters
      map_marker_proportional_scale_type: linear
      map_marker_color_mode: fixed
      show_legend: true
      quantize_map_value_colors: false
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      custom_color_enabled: false
      custom_color: forestgreen
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      series_types: {}
      value_format: 0.00,, "M"
      single_value_title: Total Clicks
      map_latitude: 40.762861133145016
      map_longitude: -74.05746459960939
      map_zoom: 10
      height: 5
      width: 6

    - name: daily_users_and_impressions
      title: Daily Users and Impressions
      type: looker_column
      model: doubleclick_dfp
      explore: impressions
      dimensions: [impressions.impression_date]
      measures: [impressions.users, impressions.count]
      sorts: [impressions.impression_date desc]
      limit: '500'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: ordinal
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      column_group_spacing_ratio: ''
      y_axis_orientation: [left, right]
      series_types:
      impressions.count: line

    - name: top_advertisers
      title: Top Advertisers
      type: looker_bar
      model: doubleclick_dfp
      explore: impressions
      dimensions: [impressions.advertiser_id]
      measures: [impressions.count, impressions.users]
      filters:
        impressions.advertiser_id: not 0
      sorts: [impressions.count desc]
      limit: '10'
      column_limit: '50'
      query_timezone: America/Los_Angeles
      stacking: ''
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      limit_displayed_rows: false
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      show_null_points: true
      point_style: none
      interpolation: linear
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      series_types: {}
