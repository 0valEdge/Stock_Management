{{ config(schema='Inventory') }}

with shipmethod as (

    select * from {{ source('inventory','shipmethod') }}

)
select
        {{ dbt_utils.generate_surrogate_key(['a.SHIPMETHODID']) }} as ShipMethodKey,
        a.* from shipmethod a