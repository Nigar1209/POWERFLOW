select 
   r.user_id,
   r.registration_time,
   r.device_id,
   COALESCE (m.channel, 'organic') AS channel,
   COALESCE (m.camapign_id, 'organic') AS campaign_id,
   COALESCE (m.attribution_cost, 0) AS attribution_cost
FROM {{ ref('registrations_clean') }} AS r
LEFT JOIN {{ ref('marketing_attribution') }} AS m
    ON r.device_id = m.device_id