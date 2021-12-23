select r.research_id, r.place_id, rp.place_info, rp.place_name, rp.place_code,
 to_jsonb(array_agg(jsonb_build_object('picture_id', p.pic_seq, 'pic_name', p.pic_name, 'pic_path', p.pic_path, 'pic_date', to_char(p.pic_date, 'YYYY-MM-DD HH24:MI:SS')))) as picturelist , 
 case when rp.place_code is null then '삭제된 조사지' else rp.place_code||'-'||rp.place_name end as research_text,
 r.research_code,
 st_x(p.geom) as lon,
 st_y(p.geom) as lat,
 st_transform(st_setsrid(r.geom, 4326),3857) ,
 ST_AsMVTGeom(st_transform(st_setsrid(r.geom, 4326),3857), ST_TileEnvelope(5, 27, 12)) as geom,
 to_char(r.create_date,'YYYY-MM-DD HH24:MI') as update_date,
 case when u.team_id = r.team_id then u.user_name else u.user_name || '(부서이동)' end as user_name, 
 u.user_type, 
 case when t.team_name != '' then t.team_name else '관리자' end as team_name,
 r.team_id,
 r.company_id
 from ocean.research r
 inner join ocean.users u on r.user_id = u.user_id 
 inner join ocean.pictures p on p.research_id = r.research_id  
 left outer join ocean.research_place rp on rp.place_id = r.place_id 
 left outer join ocean.teams t on t.team_id = r.team_id 
 where 1=1
 and r.use_yn = 1 
   and r.company_id = 18
     group by r.research_id, rp.place_info, rp.place_name, rp.place_code, p.geom, u.team_id, u.user_name,u.user_type, t.team_name
 order by r.create_date desc
 
 select r.research_id, r.place_id, rp.place_info, rp.place_name, rp.place_code,
 to_jsonb(array_agg(jsonb_build_object('picture_id', p.pic_seq, 'pic_name', p.pic_name, 'pic_path', p.pic_path, 'pic_date', to_char(p.pic_date, 'YYYY-MM-DD HH24:MI:SS')))) as picturelist , 
 case when rp.place_code is null then '삭제된 조사지' else rp.place_code||'-'||rp.place_name end as research_text,
 r.research_code,
 st_x(p.geom) as lon,
 st_y(p.geom) as lat,
 ST_AsMVTGeom(st_transform(st_setsrid(r.geom, 4326),3857), ST_TileEnvelope(5, 27, 12)) as geom,
 to_char(r.create_date,'YYYY-MM-DD HH24:MI') as update_date,
 case when u.team_id = r.team_id then u.user_name else u.user_name || '(부서이동)' end as user_name, 
 u.user_type, 
 case when t.team_name != '' then t.team_name else '관리자' end as team_name,
 r.team_id,
 r.company_id
 from ocean.research r
 inner join ocean.users u on r.user_id = u.user_id 
 inner join ocean.pictures p on p.research_id = r.research_id  
 left outer join ocean.research_place rp on rp.place_id = r.place_id 
 left outer join ocean.teams t on t.team_id = r.team_id 
 where 1=1
 and r.use_yn = 1 
   and r.company_id = 18
     group by r.research_id, rp.place_info, rp.place_name, rp.place_code, p.geom, u.team_id, u.user_name,u.user_type, t.team_name
 order by r.create_date desc
 
 
 
select st_transform(st_setsrid(geom, 4326),3857)       
from test_point   
  

WITH mvtgeom AS
  (
	 select r.research_id, r.place_id, rp.place_info, rp.place_name, rp.place_code,
	 to_jsonb(array_agg(jsonb_build_object('picture_id', p.pic_seq, 'pic_name', p.pic_name, 'pic_path', p.pic_path, 'pic_date', to_char(p.pic_date, 'YYYY-MM-DD HH24:MI:SS')))) as picturelist , 
	 case when rp.place_code is null then '삭제된 조사지' else rp.place_code||'-'||rp.place_name end as research_text,
	 r.research_code,
	 st_x(p.geom) as lon,
	 st_y(p.geom) as lat,
	 st_transform(st_setsrid(r.geom, 4326),3857) ,
	 ST_AsMVTGeom(st_transform(st_setsrid(r.geom, 4326),3857), ST_TileEnvelope(5, 27, 12)) as geom,
	 to_char(r.create_date,'YYYY-MM-DD HH24:MI') as update_date,
	 case when u.team_id = r.team_id then u.user_name else u.user_name || '(부서이동)' end as user_name, 
	 u.user_type, 
	 case when t.team_name != '' then t.team_name else '관리자' end as team_name,
	 r.team_id,
	 r.company_id
	 from ocean.research r
	 inner join ocean.users u on r.user_id = u.user_id 
	 inner join ocean.pictures p on p.research_id = r.research_id  
	 left outer join ocean.research_place rp on rp.place_id = r.place_id 
	 left outer join ocean.teams t on t.team_id = r.team_id 
	 where 1=1
	 and r.use_yn = 1 
	   and r.company_id = 18
	     group by r.research_id, rp.place_info, rp.place_name, rp.place_code, p.geom, u.team_id, u.user_name,u.user_type, t.team_name
	 order by r.create_date desc
  )
  SELECT ST_AsMVT(mvtgeom.*,'ocean_sequences')
  FROM mvtgeom