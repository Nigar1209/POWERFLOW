select 
  g.device_id,
  g.attribution_time,
  'google_ads' AS channel,
  g.campaign as campaign_id,
  c.cost AS attribution_cost
from {{ source('powerflow', 'google_ads') }} AS g
LEFT JOIN {{ ref('campaign_cost') }} AS c
   ON c.campaign_id = g.campaign