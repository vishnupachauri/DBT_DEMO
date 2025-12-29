with bike as (

select 
RIDE_ID,
RIDEABLE_TYPE,
Date(TO_TIMESTAMP(started_at)) as trip_date,
--DATE(TO_TIMESTAMP(ENDED_AT)) as trip_end_date,
START_STATIO_ID as station_id,
END_STATION_ID as end_station_id,
MEMBER_CSUAL as member_casual,
--DATE(TO_TIMESTAMP(ENDED_AT)) - DATE(TO_TIMESTAMP(started_at)) as trip_duartion,
TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ENDED_AT)) as trip_duartion_seconds


from  {{ source('demo', 'bike') }}

where RIDE_ID != 'ride_id'


)

select * 
from bike