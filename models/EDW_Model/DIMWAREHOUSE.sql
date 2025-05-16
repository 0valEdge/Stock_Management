{{ config(schema='Inventory') }}

with source as (
	select * from {{ ref('WAREHOUSE') }}
)

select * from source