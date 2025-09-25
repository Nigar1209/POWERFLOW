select
    l.user_id,
    l.transaction_date,
    l.daily_revenue,
    l.ltv,
    l.lifetime,
    u.campaign_id,
    u.channel,
    u.attribution_cost,
    case
        when u.attribution_cost = 0 then ltv else round(l.ltv / u.attribution_cost, 2)
    end as roi
from {{ ref("int_LTV") }} l
join {{ ref("users_with_marketingattributions") }} u on l.user_id = u.user_id
