-- postgreSQL에 postgis 추가
CREATE EXTENSION postgis;

drop table test_point;
-- 1. 공간데이터를 insert 할 테이블 생성 
CREATE TABLE test_point
(
  feature_id character varying(10),
  lon numeric,
  lat numeric,
  geom geometry
)
WITH (
  OIDS=FALSE
);
ALTER TABLE test_point OWNER TO strong1133;


-- 2. 공간데이터를 insert
-- 4326
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00002',
               127.32132,
               37.34567,
               st_geomfromtext('POINT(127.32132 37.34567)', 4326))
            
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(127.2226049 37.5417484)', 4326))
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00002',
               127.2226049,
               37.5417484,
               st_geomfromtext('LINESTRING(127.2226049 37.5417484, 127.22273 37.54262)', 4326))

-- 5181
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00003',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(219672.9857722169 449160.958068931)', 4326))
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00004',
               127.2226049,
               37.5417484,
               st_geomfromtext('LINESTRING(219672.9857722169 449160.958068931, 219683.81250771327 449257.7214340833)', 4326))

-- 3857
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00005',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT (14162355.59486183 4514890.964717012)', 4326))
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00006',
               127.2226049,
               37.5417484,
               st_geomfromtext('LINESTRING (14162355.59486183 4514890.964717012, 14162369.52093013 4515013.332563893)', 4326))
      
               
               
               POINT (219672.9857722169 449160.958068931)
               LINESTRING (219672.9857722169 449160.958068931, 219683.81250771327 449257.7214340833)
               
-- 태국
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00008',
       			100.53494,
                13.72503,
               st_geomfromtext('POINT(1542516.4721874266 11191676.261413943)', 5181))
              
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00006',
       			100.53494,
                13.72503,
               st_geomfromtext('LINESTRING (11191676.261413943 1542516.4721874266, 11191542.201230396 1542475.6483009586, 11191496.513361437 1542461.6743158856, 11191483.70754855 1542457.7575611179, 11191426.792877607 1542440.3822849381, 11191248.448262457 1542385.9750611281, 11191104.39938459 1542342.1208139036, 11191098.425744541 1542340.302226977, 11191052.114900826 1542326.2034186106, 11191006.424320951 1542312.2934497446, 11190980.280263837 1542304.3102527042)', 5181))
               
 https://www.google.co.kr/maps/@37.5417484,127.2226049,21z?hl=ko

               
-- 3.  geomerty 컬럼에서 경도, 위도 구하기     
select * from test_point
select st_x(geom),st_y(geom) from test_point

-- 4. srid 구하기
select srid(geom) from test_point

select st_transform(st_setsrid(geom, 4326),3857)       
from test_point   
  

 select
 geom,
 ST_AsMVTGeom(st_transform(st_setsrid(geom, 4326),5181) , ST_TileEnvelope(7, 109, 49)) 
 from test_point 
 
 select
 geom,
 ST_AsMVTGeom(geom , ST_TileEnvelope(14, 13982, 6346)) 
 from test_point 

  select
 geom,
 ST_AsMVTGeom(geom , ST_TileEnvelope(14, 12767 ,7561)) 
 from test_point 


 select
 geom,
 ST_AsMVTGeom(geom) s
 from test_point 
  
  
  
  
  
  