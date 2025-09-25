select
    t.user_id,
    t.transaction_date,
    t.daily_revenue,
    sum(st.daily_revenue) over (
        partition by t.user_id order by t.transaction_date
    ) as ltv,
    datediff('day', registration_time::date, transaction_date) as lifetime
from {{ ref("stg_transactions") }} t
left join {{ ref("registrations_clean") }} r on t.user_id = r.user_id
order by user_id, transaction_date asc
