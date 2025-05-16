{{ config(schema='Inventoryforecast') }}

with date_spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2000-01-01' as date)",
        end_date="cast('2099-12-31' as date)"
    ) }}
),

final as (
    select
        date_day as date,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        extract(quarter from date_day) as quarter,
        extract(week from date_day) as week,
        to_char(date_day, 'Day') as day_name,
        to_char(date_day, 'YYYY-MM') as year_month,
        to_char(date_day, 'YYYY-MM-DD') as full_date,
        case when extract(dow from date_day) in (0, 6) then true else false end as is_weekend
    from date_spine
)

select * from final
