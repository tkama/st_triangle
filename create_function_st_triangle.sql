/**
 * Create triangle geometry.
 * @param lon double precision center point WGS84 SRID:4326
 * @param lat double precision WGS84 SRID:4326
 * @param r double precision circumradius by the meter
 * @return geometry
 **/
CREATE OR REPLACE FUNCTION st_triangle( lon double precision, lat double precision , r double precision )
RETURNS geometry
AS 'with t_plist(id,n)as (
    values (1, 25 ) , (2, 4 ) , (3, 14 ) ,(4, 25 ) )
SELECT
 ST_SetSRID( ST_MakePolygon(ST_MakeLine( array( SELECT geom 
FROM
(
    SELECT
      id, geom
    FROM
     ST_dumppoints( ST_ExteriorRing( ST_Buffer( ST_POINT( $1 , $2)::geography , $3)::geometry  ) )  AS c
     , t_plist
    WHERE 
     t_plist.n = path[1]
    ORDER BY t_plist.id
) AS a ) ) ) , 4326 );'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

/**
 * Create triangle geometry.
 * @param center_point geometry 
 * @param r double precision circumradius by the meter
 * @return geometry
 **/
CREATE OR REPLACE FUNCTION st_triangle( center_point geometry , r double precision )
RETURNS geometry
AS 'with t_plist(id,n)as (
    values (1, 25 ) , (2, 4 ) , (3, 14 ) ,(4, 25 ) )
SELECT
 ST_SetSRID( ST_MakePolygon(ST_MakeLine( array( SELECT geom 
FROM
(
    SELECT
      id, geom
    FROM
     ST_dumppoints( ST_ExteriorRing( ST_Buffer( ST_Transform( $1 , 4326)::geography , $2 )::geometry  ) )  AS c
     , t_plist
    WHERE 
     t_plist.n = path[1]
    ORDER BY t_plist.id
) AS a ) ) ) , 4326 );'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

/**
 * Create triangle geometry.
 * @param center_point geography 
 * @param r double precision circumradius by the meter
 * @return geography
 **/
CREATE OR REPLACE FUNCTION st_triangle( center_point geography , r double precision )
RETURNS geography
AS 'with t_plist(id,n)as (
    values (1, 25 ) , (2, 4 ) , (3, 14 ) ,(4, 25 ) )
SELECT
 ST_SetSRID( ST_MakePolygon(ST_MakeLine( array( SELECT geom 
FROM
(
    SELECT
      id, geom
    FROM
     ST_dumppoints( ST_ExteriorRing( ST_Buffer($1 , $2 )::geometry  ) )  AS c
     , t_plist
    WHERE 
     t_plist.n = path[1]
    ORDER BY t_plist.id
) AS a ) ) ) , 4326 )::geography ;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;