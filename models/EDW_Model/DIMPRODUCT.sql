{{ config(schema='Inventory') }}

with PRODUCT as (

    select * from {{ source('inventory','product') }}

),

PRODUCTLISTPRICEHISTORY as (

    select * from {{ source('inventory','productlistpricehistory') }}

),
	 
DIMPRODUCT as (

    select 
        a.*,b.STARTDATE,b.ENDDATE
    from PRODUCT a
    inner join PRODUCTLISTPRICEHISTORY b
	on a.PRODUCTID = b.PRODUCTID
    
),

final as (

select row_number() over (order by a.PRODUCTID) as PRODUCTKEY, a.*
	 from DIMPRODUCT a
		
)
select * from final