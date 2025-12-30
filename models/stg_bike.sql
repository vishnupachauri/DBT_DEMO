with bike as (


select 
	RIDE_ID ,
	STARTED_AT ,
	ENDED_AT ,
	START_STATION_NAME ,
	START_STATION_ID ,
	END_STATION_NAME ,
	END_STATION_ID ,
	START_LAT ,
	START_LNG ,
	END_LAT ,
	END_LNG ,
	MEMBER_CSUAL

from {{ source('demo', 'bike') }}
where RIDE_ID != 'bikeid'

)

select *
from bike