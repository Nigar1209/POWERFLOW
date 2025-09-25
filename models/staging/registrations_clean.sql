select 
    user_id,
    registration_time,
    device_id,
    email,
    platform,
    country
from {{ source('powerflow', 'registrations') }}
where user_id IS NOT NULL