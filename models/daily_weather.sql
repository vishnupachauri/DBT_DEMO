with daily_weather as(


select 

date(time) as daily_weather,
weather,
TEMP,
pressure,
humidity,
clouds

from {{ source('demo', 'weather') }}

),

daily_weather_agg as (

select 
daily_weather,
weather,
round(avg(TEMP)) as avg_temp,
round(avg(pressure)) as avg_pressure,
round(avg(humidity)) as avg_humidity,
round(avg(clouds)) as avg_clouds

from daily_weather

group by daily_weather,weather

qualify ROW_NUMBER() OVER(PARTITION BY daily_weather order by count(weather) desc) =1


)



select 
*
from daily_weather_agg
