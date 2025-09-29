select 
user_id,
DATE(transaction_time) as transaction_date,
SUM(total_value) AS daily_revenue
from {{ source('powerflow', 'transactions') }}
group by user_id, transaction_date