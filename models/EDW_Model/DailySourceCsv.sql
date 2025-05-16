{{ config(schema='Inventoryforecast') }}

with AMAZONSALESHISTORY as (

    select * from {{ source('DailysourceCSV','AMAZONSALESHISTORY') }}

),

ROGERSALESHISTORY as (

    select * from {{ source('DailysourceCSV','ROGERSALESHISTORY')}}

),

TARGETSALESHISTORY as (
    select * from {{ source('DailysourceCSV','TARGETSALESHISTORY') }}
),

WALMARTSALESHISTORY as (
    select * from {{ source('DailysourceCSV','WALMARTSALESHISTORY') }}
),

DailysourceCSV as (

    select * from AMAZONSALESHISTORY
    union all 
    select * from ROGERSALESHISTORY
    union all 
    select * from TARGETSALESHISTORY
    union all 
    select * from WALMARTSALESHISTORY
     
)


select * from DailysourceCSV
