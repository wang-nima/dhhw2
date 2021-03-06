CREATE TABLE tramstops (
  tram_id VARCHAR2(10) PRIMARY KEY,
  shape SDO_GEOMETRY);

insert into tramstops values(
't1psa',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(180,20,280,120,180,220)));

insert into tramstops values(
't2ohe',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(204,107,274,177,204,247)));

insert into tramstops values(
't3sgm',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(253,6,328,81,253,156)));

insert into tramstops values(
't4hnb',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(476,179,526,229,476,279)));

insert into tramstops values(
't5vhe',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(447,249,497,299,447,349)));

insert into tramstops values(
't6ssl',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(213,382,263,432,213,482)));

insert into tramstops values(
't7helen',
SDO_GEOMETRY(
2003,
NULL,
NULL,
SDO_ELEM_INFO_ARRAY(1,1003,4),
SDO_ORDINATE_ARRAY(378,360,478,460,378,560)));


INSERT INTO user_sdo_geom_metadata
    (TABLE_NAME,
     COLUMN_NAME,
     DIMINFO,
     SRID)
  VALUES (
  'tramstops',
  'shape',
  SDO_DIM_ARRAY(   -- 20X20 grid
    SDO_DIM_ELEMENT('X', 0, 1000, 0.005),
    SDO_DIM_ELEMENT('Y', 0, 1000, 0.005)
     ),
  NULL   -- SRID
);

CREATE INDEX tram_idx
   ON tramstops(shape)
   INDEXTYPE IS MDSYS.SPATIAL_INDEX;


-- test
-- select t.tram_id, t.shape
-- from tramstops t
-- where SDO_INSIDE(
--   t.shape,
--   SDO_GEOMETRY(2003,NULL,NULL,
--     SDO_ELEM_INFO_ARRAY(1,1003,3),
--     SDO_ORDINATE_ARRAY(162,381,264,483))
-- ) ='TRUE';