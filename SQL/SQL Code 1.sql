
#Get all start stations
CREATE TABLE all_start_stations    
    select start_station_name, max(start_station_latitude) as latitude, max(start_station_longitude) as longitude
    from trips 
    group by start_station_name

#Get all end stations
CREATE TABLE all_end_stations    
    select end_station_name, max(start_station_latitude) as latitude, max(start_station_longitude) as longitude
    from trips 
    group by end_station_name
