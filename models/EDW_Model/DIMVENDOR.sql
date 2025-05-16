{{ config(schema='Inventory') }}

with vendor as (

    select * from {{ source('inventory','vendor') }}

)
select
        {{ dbt_utils.generate_surrogate_key(['a.BUSINESSENTITYID']) }} as VENDORKEY,
        a.* from vendor a