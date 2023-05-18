- dashboard: raj2
  title: Crossfiltering & Hidinig data related to legend
  layout: newspaper
  crossfilter_enabled: true
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: y8A9dJDMdmd9oCQWt4LNEl
  elements:
  - title: New Tile
    name: New Tile
    model: mtrmisathelook
    explore: order_items
    type: looker_donut_multiples
    fields: [order_items.total_sale_price, orders.created_date, products.average_retail_price,
      products.count, products.total_retail_price]
    fill_fields: [orders.created_date]
    sorts: [orders.created_date desc]
    limit: 3
    column_limit: 50
    show_value_labels: true
    show_silhouette: false
    totals_color: "#808080"
    font_size: 12
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    show_null_labels: false
    show_totals_labels: false
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
    defaults_version: 1
    series_types: {}
    hidden_series: []
    listen: {}
    row: 0
    col: 8
    width: 25
    height: 5
#-----------------------------------------------------------
  - title: New Tile2
    name: New Tile2
    model: mtrmisathelook
    explore: order_items
    type: looker_column
    fields: [order_items.total_sale_price, orders.created_date, products.average_retail_price,
      products.count, products.total_retail_price]
    fill_fields: [orders.created_date]
    sorts: [orders.created_date desc]
    limit: 3
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: 12
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      order_items.total_sale_price:
        is_active: true
    defaults_version: 1
    series_types: {}
    hidden_series: []
    listen: {}
    row: 0
    col: 0
    width: 25
    height: 5
