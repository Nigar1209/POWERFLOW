-- this trst checks if we have users with lifetime<0
select
    *
   
from {{ ref("int_LTV") }} as l
where lifetime<0