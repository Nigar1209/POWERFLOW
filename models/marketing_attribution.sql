select *
from {{ ref('stg_google_ads') }}
UNION ALL
select *
from {{ source('powerflow', 'appsflyer') }}