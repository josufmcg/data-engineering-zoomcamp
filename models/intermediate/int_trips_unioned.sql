with green_tripdata as (
    select * from {{ ref('stg_green_tripdata') }} -- points to sql (dbt model)
),
yellow_tripdata as (
    select * from {{ ref('stg_yellow_tripdata') }} -- points to sql (dbt model)
),

trips_unioned as (
    select * from green_tripdata
    union all
    select * from yellow_tripdata
)

select * from trips_unioned