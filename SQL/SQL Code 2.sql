##SQL Code 2

#Get number of trips from each station
CREATE TABLE trips_from
    SELECT start_station_name, COUNT(*) as trips_from_count
    FROM trips
    GROUP BY start_station_name

#Get number of trips to each station
CREATE TABLE trips_to
    SELECT end_station_name, COUNT(*) as trips_to_count
    FROM trips
    GROUP BY end_station_name


#Get number of trips between station pairs
CREATE TABLE trips_to_and_from
    SELECT start_station_name, end_station_name, COUNT(*) as trips_count 
    FROM trips
    GROUP BY end_station_name, start_station_name
    
    
#Combine all zip code features
CREATE TABLE zip_code_features
    SELECT zipcode,
            percap_income,
            median_hh_income,
            race_white_alone,
            race_black_alone,
            race_asian_alone,
            race_other_alone,
            race_mixed,
            total_pop,
            total,
            car,
            public_transport,
            bicycle,
            walk,
            other,
            from_home,
            male_total_work,
            male_car,
            male_public_transport,
            male_bicycle,
            male_walk,
            male_other,
            male_from_home,
            female_total_work,
            female_car,
            female_public_transport,
            female_bicycle,
            female_walk,
            female_other,
            female_from_home,
            total_male_population,
            male_0_to_14,
            male_15_to_29,
            male_30_to_44,
            male_45_to_59,
            male_60_to_74,
            male_75_plus,
            total_female_population,
            female_0_to_14,
            female_15_to_29,
            female_30_to_44,
            female_45_to_59,
            female_60_to_74,
            female_75_plus,
            total_pop_over_3,
            enrol_school,
            gr4_max,
            gr5_to_gr12,
            college_plus,
            not_enrolled
    FROM zipcode_attribute j, 
    (SELECT x.name,
            total,
            car,
            public_transport,
            bicycle,
            walk,
            other,
            from_home,
            male_total_work,
            male_car,
            male_public_transport,
            male_bicycle,
            male_walk,
            male_other,
            male_from_home,
            female_total_work,
            female_car,
            female_public_transport,
            female_bicycle,
            female_walk,
            female_other,
            female_from_home,
            total_male_population,
            male_0_to_14,
            male_15_to_29,
            male_30_to_44,
            male_45_to_59,
            male_60_to_74,
            male_75_plus,
            total_female_population,
            female_0_to_14,
            female_15_to_29,
            female_30_to_44,
            female_45_to_59,
            female_60_to_74,
            female_75_plus,
            total_pop_over_3,
            enrol_school,
            gr4_max,
            gr5_to_gr12,
            college_plus,
            not_enrolled
    FROM zip_transport_by_sex y, (SELECT  a.name,
                                        total_male_population,
                                        male_0_to_14,
                                        male_15_to_29,
                                        male_30_to_44,
                                        male_45_to_59,
                                        male_60_to_74,
                                        male_75_plus,
                                        total_female_population,
                                        female_0_to_14,
                                        female_15_to_29,
                                        female_30_to_44,
                                        female_45_to_59,
                                        female_60_to_74,
                                        female_75_plus,
                                        total_pop_over_3,
                                        enrol_school,
                                        gr4_max,
                                        gr5_to_gr12,
                                        college_plus,
                                        not_enrolled 
                                    FROM zip_age_sex_distribution a,
                                            zip_population_school_distribution p
                                            WHERE a.name = p.name) as x
                                            WHERE x.name = y.zip) as i
                                            WHERE j.zipcode = i.name
        
#Join zip code features with start stations
CREATE TABLE start_stations_and_features
    SELECT zip, start_station_name as station_name, latitude,longitude,
                percap_income,
                median_hh_income,
                race_white_alone,
                race_black_alone,
                race_asian_alone,
                race_other_alone,
                race_mixed,
                total_pop,
                total,
                car,
                public_transport,
                bicycle,
                walk,
                other,
                from_home,
                male_total_work,
                male_car,
                male_public_transport,
                male_bicycle,
                male_walk,
                male_other,
                male_from_home,
                female_total_work,
                female_car,
                female_public_transport,
                female_bicycle,
                female_walk,
                female_other,
                female_from_home,
                total_male_population,
                male_0_to_14,
                male_15_to_29,
                male_30_to_44,
                male_45_to_59,
                male_60_to_74,
                male_75_plus,
                total_female_population,
                female_0_to_14,
                female_15_to_29,
                female_30_to_44,
                female_45_to_59,
                female_60_to_74,
                female_75_plus,
                total_pop_over_3,
                enrol_school,
                gr4_max,
                gr5_to_gr12,
                college_plus,
                not_enrolled
    FROM zip_code_features x, all_start_stations_with_zip y
    WHERE x.zipcode = y.zip
    
    
#Join zip code features with end stations
CREATE TABLE end_stations_and_features
    SELECT zip, end_station_name as station_name, latitude,longitude,
                percap_income,
                median_hh_income,
                race_white_alone,
                race_black_alone,
                race_asian_alone,
                race_other_alone,
                race_mixed,
                total_pop,
                total,
                car,
                public_transport,
                bicycle,
                walk,
                other,
                from_home,
                male_total_work,
                male_car,
                male_public_transport,
                male_bicycle,
                male_walk,
                male_other,
                male_from_home,
                female_total_work,
                female_car,
                female_public_transport,
                female_bicycle,
                female_walk,
                female_other,
                female_from_home,
                total_male_population,
                male_0_to_14,
                male_15_to_29,
                male_30_to_44,
                male_45_to_59,
                male_60_to_74,
                male_75_plus,
                total_female_population,
                female_0_to_14,
                female_15_to_29,
                female_30_to_44,
                female_45_to_59,
                female_60_to_74,
                female_75_plus,
                total_pop_over_3,
                enrol_school,
                gr4_max,
                gr5_to_gr12,
                college_plus,
                not_enrolled
    FROM zip_code_features x, all_start_stations_with_zip y
    WHERE x.zipcode = y.zip
   
#Find union of start and end stations
CREATE TABLE stations_and_features
    start_stations_and_features
    UNION
    end_stations_and_features
    
    
#Join trip counts with zip code features 
CREATE TABLE trips_by_station
    SELECT zip, c.station as station_name, trips_from_count, trips_to_count,
                    percap_income,
                    median_hh_income,
                    race_white_alone,
                    race_black_alone,
                    race_asian_alone,
                    race_other_alone,
                    race_mixed,
                    total_pop,
                    total_transport,
                    car,
                    public_transport,
                    bicycle,
                    walk,
                    other,
                    from_home,
                    male_total_work,
                    male_car,
                    male_public_transport,
                    male_bicycle,
                    male_walk,
                    male_other,
                    male_from_home,
                    female_total_work,
                    female_car,
                    female_public_transport,
                    female_bicycle,
                    female_walk,
                    female_other,
                    female_from_home,
                    total_male_population,
                    male_0_to_14,
                    male_15_to_29,
                    male_30_to_44,
                    male_45_to_59,
                    male_60_to_74,
                    male_75_plus,
                    total_female_population,
                    female_0_to_14,
                    female_15_to_29,
                    female_30_to_44,s
                    female_45_to_59,
                    female_60_to_74,
                    female_75_plus,
                    total_pop_over_3,
                    enrol_school,
                    gr4_max,
                    gr5_to_gr12,
                    college_plus,
                    not_enrolled
    FROM trips_from a, trips_to b, stations_and_features c
    WHERE a.start_station_name = c.station_name and b.end_station_name = c.station_name
    

#Join trip pairs count data with zip codes
CREATE TABLE trips_to_and_from_with_zips
    SELECT x.start_station_name, x.end_station_name, trips_count, y.zip as start_zip, z.zip as end_zip
    FROM trips_to_and_from x, all_end_stations_with_zip z, all_start_stations_with_zip y
    where x.start_station_name = y.station_name and x.end_station_name = z.station_name

