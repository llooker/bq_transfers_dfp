### What does this Block do for me?

**(1) Replication + More** - Replication of existing DFP reports and dashboards, plus additional value-add analysis, accelerates time to value with a full plug-and-play model

**(2) Expertise** - Leverage analytics expertise of Looker + DFP product teams

**(3) Central Data Platform** - Take advantage of Looker's data platform functionality, including data actions, scheduling, permissions, alerting, parameterization (each user can only see their own data), and more


### Block Info

This Block is modeled on the schema brough in by Google's [BigQuery Transfer Service](https://cloud.google.com/bigquery/transfer/). It will cover many of the core entities involved with the DoubleClick for Publishers offering. Depending on how you use the DFP service, you may have additional entities brought in through thge BQ Transfer Service, especially any custom built reports. This Block should serve as a great jump start. Happy modeling!

The schema documentation for Doubleclick for Publishers can be found in [Google's docs](https://developers.google.com/doubleclick-publishers/docs/intro). Please note that your naming might vary slightly.



### Data Structure

* **Funnel Tables** - DFP data is modeled around three core entities: impressions, clicks, and activities. We've created a rolled-up funnel by joining these tables onto each other at a low-level of granularity using many join keys due to the lack of a single primary keys in each table.

* **Match Tables** - DFP seperates out various attributes of each event (impressions, clicks, activities) using match tables, meaning we have various "ID" columns in the funnel, which we then join onto these match tables (think of them as mapping tables). After joining, all these additional attributes which can be used to evaluate impressions, clicks, activities, revenue, and much more. For example, we have a an `AdUnitId` column in our funnel. To get the names and more information about those Ad Units, we join on our `match_table_ad_units` table.

### Block Structure (Explores)
* **Impression Funnel** - provides a holistic view at your event sequences, including impressions, clicks, activities, revenue, etc., which can be cut-and-sliced freely by almost any other attribute (ad type, advertiser name, ad publishing page, etc.).

* **Audience Metrics** - this explore gives us the same metrics - impressions, clicks, and activities - cut by any attribute of the "Audience Segment". Audience Segments are defined by a number of custom criteria, such as "Industy = Sales, Age < 50, Company = Google". See "Technical Details around Block Structure" below for a full explanation of why we recommend using two "Explore" pages


### Required Customization

* **sql_table_name** - in each of the views, the `sql_table_name` parameter must be changed to match your table names.

* **Funnel Naming Customizations** - depending on whether you used "[Data Transfers](https://support.google.com/dfp_premium/answer/1733128?hl=en)" or "[Google Transfer Services](https://cloud.google.com/bigquery/transfer/)", your naming convention might differ. You may need to substitute the three primary tables in the funnel, from `impressions_####` to `NetworkImpressions_####`, and similar for `clicks` and `activities`. These comments can be found in-line in the `impression_funnel` view file.

### Technical Details around Block Structure
* In addition to the fact they they're sequential, there are several advantages to "funnelizing" these entities. It gives us a single view in which to cut-and-slice the data by any attribute or metric available.
* However, `audience_segment_id`, which contains the IDs of all audience segments that were exposed to an impression, click, or activity, is represented in a list structure (meaning there is not separate columns for each audience name, it's a running list within one column).
* Due to the number of segments in the `audience_segment_id` column (up to 32), we cannot join our `match_table_audience_segment` onto our funnel to. The below explains this in more technical detail:
  * **Joining on IN** - BigQuery's lack of support for joining on an "IN" clause means we cannot join the match table onto the funnel using a `JOIN ON IN` pattern, these tables cannot be joined on in a clean manner
  * **Parsing** - another option is to parse the (up to) 32 records into 32 different columns and join on `match_table.id = funnel.segment_1 or funnel._segment_2` etc.. This becomes extremely unperformant and often overwhelms BigQuery memoery, resulting in errors. Due to the inconsistency in behavior, this Block is not modeled using that pattern
  * **Duplication** - a final option would be to duplicate each row for each audience segment using `JOIN(UNNEST(SPLIT(AudienceSegmentIds,"|")) as Audience)` pattern, then nest the new `Audience` column as a new column (to avoid fanouts), then join the match table from there. However, this requires the existance of some primary key on our `impressions`, `clicks`, and `activities` tables in order to avoid fanout aggregations, and no such primary key exists. It also is extremely poor for performance, and can potentially overwhelm BQ memory.

* Instead of dealing with non-performant and error-prone modeling, it's recommended to create New Explores instead. It also means we cannot take advantage of the partitioned tables, since we're using a [Persistent Derived Table](https://docs.looker.com/data-modeling/learning-lookml/derived-tables).
* Because of this limitation, Google also exports data at an Audience level (hence the `audience_explore` tables), meaning we can make a new Explore with the audience as the base entity. We can also combine these onto dashboards to view them side-by-side. To view Audience level information - use a separate Explore table



### Potential Improvements

* **Cost / Performance** - GCP recently introduced partitioned tables into Data Transfer Service. We can architect this model using those partitioned tables and `_PARTITIONTIME` psuedo-column. However, this comes at the sacrifice of persisting the funnel using PDTs. Depending on the size of your tables, this can result in either an increase or decrease in cost and performance.
  * If you are concerned with cost and performance, we recommend enabling [BigQuery Cloud Billing](https://looker.com/platform/blocks/source/google-cloud-billing-by-datatonic) and [performance logs](https://looker.com/platform/blocks/source/google-bigquery-performance-by-datatonic), which Looker also has dedicated Blocks for.

* **Single Explore** - there may be a way to turn the `AudienceSegmentId` column into a nested field after following the "Duplication" pattern described above. This would let us unnest the audience from each event table and incorporate "audience" attributes into the funnel. However, testing as shown this to be extremely non-performant, and it's unknown whether fannouts would occur.
