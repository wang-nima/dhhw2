select s.student_id
from students s
where SDO_INSIDE(
  s.shape,
  SDO_GEOMETRY(2003,NULL,NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,3),
    SDO_ORDINATE_ARRAY(100,100,300,300))
) ='TRUE';