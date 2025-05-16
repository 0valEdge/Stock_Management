{{ config(schema='Inventoryforecast') }}

with DIMINVENTORY as (
    select * from {{ ref('DIMPRODUCT') }}
)
select * from DIMINVENTORY