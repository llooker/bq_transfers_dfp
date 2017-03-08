### Block Info

_This Block is modeled on the schema brough in by Google's BigQuery Transfer Service. It will cover many of the core entities involved with the DoubleClick for Publishers offering. Depending on how you use the DFP service, you may have additional entities brought in through thge BQ Transfer Service, especially any custom built reports. This Block should serve as a great jump start. Happy modeling!_

_The schema documentation for Doubleclick for Publishers can be found in [Google's docs](https://developers.google.com/doubleclick-publishers/docs/intro). Please note that your naming might vary slightly._

### Notes

* **sql_table_name** - in each of the views, the `sql_table_name` parameter must be changed to match your table names, particularly the tables with a wildcard operator when using `_table_suffix`
* **funnel** - if your impression funnel doesn't reflect the same total clicks or revenue as when those tables are queried separately, check your `user_id` keys in your impressions and clicks tables to see if there are any missing entries
