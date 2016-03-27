# st_triangle
Create triangle geometry using postgis.

# How to use

```sql:test_st_triangle.sql
SELECT ST_AsText( st_triangle( 139.76719 , 35.6811 ,50) ) 
UNION
SELECT ST_AsText( st_triangle( 139.76719 , 35.6811 ,100) ) 
UNION
SELECT ST_AsText( st_triangle( 139.76719 , 35.6811 ,150) )  
UNION
SELECT ST_AsText( st_triangle( 139.76719 , 35.6811 ,200) )  

```

![demo.png](https://github.com/tkama/st_triangle/blob/master/demo.png)

