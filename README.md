# st_triangle
Create triangle geometry using postgis.

# Install

+ Download sql file
```shell:
wget https://github.com/tkama/st_triangle/raw/master/create_function_st_triangle.sql
```

+ Execute query
```shell:
psql -d DATABASE_NAME -U USER_NAME  -f create_function_st_triangle.sql
```

# How to use

This UDF supports three data types.

```sql
SELECT 
 -- [type1] lon , lat , radius
 st_triangle( 139.76719 , 35.6811 ,50) AS type1
 -- [type2] geometry point , radius 
 st_triangle( ST_POINT(139.76719 , 35.6811) ,50) AS type2 
 -- [type3] geography point , raduius 
 st_triangle( ST_POINT(139.76719 , 35.6811)::geography ,50) AS type3
 ```

# Demo 
Let's draw 4 triangles around Tokyo station.

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

