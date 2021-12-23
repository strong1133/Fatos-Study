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
               4569096,
               1350664,
               st_geomfromtext('POINT(126.919333333333333333333333333333333333 37.5184444444444444444444444444444444444)', 4326))
            
-- bessel
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(956590.690622897  1944306.7322345087)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(966539.4156533345  1942368.4475461391)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(959944.7133597457  1949384.217727904)', 2097));

  insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(954076.9097813856  1950616.584908657)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(943500.569498015  1943920.0630506591)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(961583.4189376748  1950868.0938839014)', 2097));

  insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(964565.3973549678  1940191.6172873226)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(962974.3258911546  1948078.8320236946)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(961069.0920226944  1951058.4892516655)', 2097));

  insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(955488.363395387  1948454.6317222642)', 2097));
               
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00001',
               127.2226049,
               37.5417484,
               st_geomfromtext('POINT(962331.0869820929  1948029.33664953)', 2097));
               


-- 태국
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00008',
       			456.9096,
                13.50664,
               st_geomfromtext('POINT(456.9096 13.50664)', 5181))
              
insert into test_point (feature_id,lon,lat,geom) 
       values ('test_00006',
       			100.53494,
                13.72503,
               st_geomfromtext('LINESTRING (11191676.261413943 1542516.4721874266, 11191542.201230396 1542475.6483009586, 11191496.513361437 1542461.6743158856, 11191483.70754855 1542457.7575611179, 11191426.792877607 1542440.3822849381, 11191248.448262457 1542385.9750611281, 11191104.39938459 1542342.1208139036, 11191098.425744541 1542340.302226977, 11191052.114900826 1542326.2034186106, 11191006.424320951 1542312.2934497446, 11190980.280263837 1542304.3102527042)', 5181))
               
 https://www.google.co.kr/maps/@37.5417484,127.2226049,21z?hl=ko

               
-- 3.  geomerty 컬럼에서 경도, 위도 구하기     
select * from test_pointㅂ
select st_x(geom),st_y(geom) from test_point

-- 4. srid 구하기
select srid(geom) from test_point

-- 5. mvt
select st_transform(st_setsrid(geom, 4326),5186)       
from test_point   
  

 select
 geom,
 ST_AsMVTGeom(st_transform(st_setsrid(geom, 4326),5181) , ST_TileEnvelope(7, 109, 49)) 
 from test_point 
 
 POINT (117.9937770562505 19.6948753050249)
 
 
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
  
 
  
  insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                126.93491666666667,
                37.516888888888886,
                st_geomfromtext('POINT(194432.00968239253 446075.2688655817)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.06991666666667,
                37.53794444444444,
                st_geomfromtext('POINT(206365.08102429102 448412.6735122701)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.00869444444444,
                37.531444444444446,
                st_geomfromtext('POINT(200954.25269892512 447688.9072359959)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04427777777778,
                37.54577777777778,
                st_geomfromtext('POINT(204098.65801845168 449280.6764300097)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04377777777778,
                37.54555555555555,
                st_geomfromtext('POINT(204054.48378565343 449255.99091625895)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04375,
                37.54536111111111,
                st_geomfromtext('POINT(204052.03935268807 449234.4085819682)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.06933333333333,
                37.54525,
                st_geomfromtext('POINT(206312.91553981477 449223.46900421684)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04330555555556,
                37.54569444444444,
                st_geomfromtext('POINT(204012.7450433793 449271.38609442365)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.02930555555555,
                37.54761111111111,
                st_geomfromtext('POINT(202775.46416179734 449483.6189052686)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.09141666666666,
                37.53802777777778,
                st_geomfromtext('POINT(208265.27227918358 448423.58020656323)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.03897222222223,
                37.54405555555556,
                st_geomfromtext('POINT(203629.87667448938 449089.31466631236)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.07708333333333,
                37.498194444444444,
                st_geomfromtext('POINT(207002.1599972865 444001.3928511299)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                126.93947222222222,
                37.544472222222225,
                st_geomfromtext('POINT(194836.67465325657 449136.4395740654)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.00805555555556,
                37.53052777777778,
                st_geomfromtext('POINT(200897.79210698337 447587.16190683586)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                126.9935,
                37.52711111111111,
                st_geomfromtext('POINT(199611.2037886962 447207.9218576666)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.07708333333333,
                37.49825,
                st_geomfromtext('POINT(207002.15485789918 444007.55884693895)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.03725,
                37.558527777777776,
                st_geomfromtext('POINT(203477.01683994007 450695.50693081896)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                0,
                0,
                st_geomfromtext('POINT(-6793459.602983705 -23707543.2749807)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04444444444445,
                37.54569444444444,
                st_geomfromtext('POINT(204113.39121720384 449271.4345264953)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.00675,
                37.49975,
                st_geomfromtext('POINT(200782.68875693157 444171.18036503356)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.11938888888889,
                37.48269444444445,
                st_geomfromtext('POINT(210745.37568812864 442285.0405863889)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04441666666666,
                37.54566666666667,
                st_geomfromtext('POINT(204110.9379338103 449268.350308324)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                126.97791666666667,
                37.5565,
                st_geomfromtext('POINT(198234.4463018897 450469.94642624614)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                126.85869444444444,
                37.495555555555555,
                st_geomfromtext('POINT(187689.96635357157 443714.8141801163)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.06288888888889,
                37.55911111111111,
                st_geomfromtext('POINT(205742.35049338432 450761.4902691889)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.09716666666667,
                37.463,
                st_geomfromtext('POINT(208782.18277424236 440096.9154251012)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.07877777777777,
                37.53402777777778,
                st_geomfromtext('POINT(207148.60898156455 447978.5985632476)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.05705555555555,
                37.560805555555554,
                st_geomfromtext('POINT(205226.82116601206 450949.2187432028)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                126.99402777777777,
                37.537083333333335,
                st_geomfromtext('POINT(199657.91040030058 448314.72184567)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.0715,
                37.53355555555556,
                st_geomfromtext('POINT(206505.3956891425 447925.6639963916)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.11177777777777,
                37.5095,
                st_geomfromtext('POINT(210068.62262173597 445259.2971000129)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.06186111111111,
                37.531888888888886,
                st_geomfromtext('POINT(205653.5715767285 447740.0666139992)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04177777777778,
                37.463027777777775,
                st_geomfromtext('POINT(203881.9385239097 440096.3131417637)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.0665,
                37.53911111111111,
                st_geomfromtext('POINT(206063.01776558312 448541.93688729865)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.08366666666667,
                37.53669444444444,
                st_geomfromtext('POINT(207580.45087372995 448274.9477188849)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04433333333333,
                37.54580555555555,
                st_geomfromtext('POINT(204103.56608383465 449283.7618374886)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04375,
                37.5455,
                st_geomfromtext('POINT(204052.03195532266 449249.8236932688)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04430555555555,
                37.54555555555555,
                st_geomfromtext('POINT(204101.12478202258 449256.0134430349)', 5178));
        

        insert into test_point (feature_id,lon,lat,geom) 
        values ('testData',
                127.04430555555555,
                37.54575,
                st_geomfromtext('POINT(204101.11429814945 449277.59459971543)', 5178));
  
  