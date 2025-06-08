with 

source_employees as (

    select * 
    from {{ source('erp', 'employees') }}

),

renamed as (
    select
        cast(id as int) as employee_pk
        , cast(reportsto as int) as manager_fk
        , firstname ||' '|| lastname as employee_name
        , cast(title as varchar) as employee_title
        --, cast(titleofcourtesy as varchar) as employee_
        , cast(birthdate as date) as employee_birth_date
        , cast(hiredate as date) as employee_hire_date
        --, cast(address as varchar) as employee_
        , cast(city as varchar) as employee_city
        , cast(region as varchar) as employee_region
        --, cast(postalcode as varchar) as employee_
        , cast(country as varchar) as employee_county
        --, cast(homephone as varchar) as employee_
        --, cast(extension as varchar) as employee_
        --, cast(photo as varchar) as employee_
        --, cast(notes as varchar) as employee_
        --, cast(photopat as varchar) as employee_

    from source_employees
)

select * 
from renamed
