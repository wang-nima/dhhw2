INSERT INTO user_sdo_geom_metadata
    (TABLE_NAME,
     COLUMN_NAME,
     DIMINFO,
     SRID)
  VALUES (
  'STUDENTS',
  'shape',
  SDO_DIM_ARRAY(   -- 20X20 grid
    SDO_DIM_ELEMENT('X', 0, 1000, 0.005),
    SDO_DIM_ELEMENT('Y', 0, 1000, 0.005)
     ),
  NULL   -- SRID
);

CREATE INDEX stu_idx
   ON students(shape)
   INDEXTYPE IS MDSYS.SPATIAL_INDEX;

select s.student_id
from students s
where SDO_INSIDE(
  s.shape,
  SDO_GEOMETRY(2003,NULL,NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,3),
    SDO_ORDINATE_ARRAY(100,100,300,300))
) ='TRUE';