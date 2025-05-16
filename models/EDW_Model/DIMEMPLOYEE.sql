{{ config(schema='Inventory') }}

with employee as (

    select * from {{ source('inventory','employee') }}

),

person as (

    select * from {{ source('inventory','person') }}

),

personphone as (

    select * from {{ source('inventory','personphone') }}

),
DIMEMPLOYEE as (
select
        {{ dbt_utils.generate_surrogate_key(['a.businessentityid']) }} as employee_key,
        a.*,
        b.persontype,
        b.title,
        concat_ws(' ', b.firstname, b.middlename, b.lastname) as employee_name,
        b.email,
        c.phonenumber
    from employee a
    join person b on a.businessentityid = b.businessentityid
    left join personphone c on a.businessentityid = c.businessentityid
)

select * from DIMEMPLOYEE