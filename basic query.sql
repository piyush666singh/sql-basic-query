CREATE TABLE volunteers (
vol_id int UNIQUE,
name varchar(20),
park varchar(30),
weekly_goal int,
max_bags int,
PRIMARY KEY (vol_id)
);

INSERT INTO volunteers
VALUES
(1, 'Gladys', 'Prospect Park', 3, 5),
(2, 'Catherine', 'Central Park', 2, 2),
(3, 'Georgeanna', 'Central Park', 2, 1),
(4, 'Wanda', 'Van Cortland Park', 1, 1),
(5, 'Ann', 'Prospect Park', 2, 7),
(6, 'Juanita', 'Riverside Park', 1, 4),
(7, 'Georgia', 'Prospect Park', 1, 3);
----------------------------------------------------------------------------------------------------------------
--The following query will return every column from the volunteers table:

SELECT *
FROM volunteers;
------------------------------------------------------------------------------------------------------------------
-- the general syntax of an SQL query:
/*SELECT columns_to_return
FROM table_to_query;*/

-- query 1 for singale column call
SELECT name
FROM volunteers;
------------------------------------------------------------------------------------------------------------------
--You can retrieve information from multiple columns by separating each one’s name with a comma,
-- as in the following query. 
--QUERY 2
SELECT park, name, vol_id
FROM volunteers;
--------------------------------------------------------------------------------------------------------------------
--The following query will return every unique value in the parks column, removing any duplicates.
-- It’s identical to the previous query except that it includes the DISTINCT keyword
--QUERY 3
  SELECT DISTINCT park
FROM volunteers;
----------------------------------------------------------------------------------------------------------------------
--To illustrate this, issue the following query that includes 
--the DISTINCT keyword but returns both the name and park columns
  -- QUERY 4
    SELECT DISTINCT name, park
    FROM volunteers;
	--------------------------------------------------------------------------------------------------------------------
	--Filtering Data with WHERE clauses
	--There may be times when you want to retrieve more granular information from tables in your database.
	-- You can filter out certain rows by including a WHERE clause in your query after the FROM clause, as in
	   --QUERY --
	  /* SELECT columns_to_return
        FROM table_to_query
        WHERE search_condition;*/
		 -- EXAMPLE 
		 SELECT name
          FROM volunteers
             WHERE (2 + 2) = 4;
--------------------------------------------------------------------------------------------------------------------
/*The following query’s WHERE clause applies a more exclusive search condition to each row.
 It will return the name and max_bags values from any row whose max_bags value is equal to 4*/
     SELECT name, max_bags
     FROM volunteers
     WHERE max_bags = 4;
	 --------------------------------------------------------------------------------------------------
	 /*You can also evaluate character string values in search condition predicates. 
	 The following query returns the vol_id and name values of every row whose name value is equal to 'Wanda'*/
	 SELECT vol_id, name
     FROM volunteers
     WHERE name = 'Wanda';

	 /*OUTPUT
	 +--------+-------+
| vol_id | name  |
+--------+-------+
|      4 | Wanda |
+--------+-------+
1 row in set (0.00 sec)*/
 -----------------------------------------------------------------------------------------------------------------
 /*Comparison: Comparison predicates compare one value expression with another; in queries, 
 it’s almost always the case that at least one of these value expressions is the name of a column. The six comparison operators are:

=: tests whether the two values are equivalent
<>: tests whether two values are not equivalent
<: tests whether the first value is less than the second
>: tests whether the first value is greater than the second
<=: tests whether the first value is less than or equal to the second
>=: tests whether the first value is greater than or equal to the second  */
----Here’s the general syntax of a query with an ORDER BY clause:
         /*SELECT columns_to_return
          FROM table_to_query
          ORDER BY column_name;*/
		  -- EXAMPLE 
		    SELECT name, max_bags
             FROM volunteers;
			 /* Output
+------------+----------+
| name       | max_bags |
+------------+----------+
| Gladys     |        5 |
| Catherine  |        2 |
| Georgeanna |        1 |
| Wanda      |        1 |
| Ann        |        7 |
| Juanita    |        4 |
| Georgia    |        3 |
+------------+----------+*/
    -- EXAMPLE 2
	SELECT name, max_bags
FROM volunteers
ORDER BY max_bags;
  /*Output
+------------+----------+
| name       | max_bags |
+------------+----------+
| Georgeanna |        1 |
| Wanda      |        1 |
| Catherine  |        2 |
| Georgia    |        3 |
| Juanita    |        4 |
| Gladys     |        5 |
| Ann        |        7 |
+------------+----------+*/
 -- the DESC keyword to the ORDER BY clause
    SELECT name, max_bags
FROM volunteers
ORDER BY max_bags DESC; 
/* +------------+----------+
| name       | max_bags |
+------------+----------+
| Ann        |        7 |
| Gladys     |        5 |
| Juanita    |        4 |
| Georgia    |        3 |
| Catherine  |        2 |
| Georgeanna |        1 |
| Wanda      |        1 |
+------------+----------+*/
          ---------------------How To Use Comparison and IS NULL Operators in SQL---------
		  CREATE TABLE running_goals (
name varchar(15),
goal int,
result int
);           



  INSERT INTO running_goals
VALUES
('Michelle', 55, 48),
('Jerry', 25, NULL),
('Milton', 45, 52),
('Bridget', 40, NULL),
('Wanda', 30, 38),
('Stewart', 35, NULL),
('Leslie', 40, 44);
/*WHERE clause comparison predicates use one of six comparison operators to compare 
one value expression with another. They typically follow a syntax like this:*/ 
/* QUERY SYNTAX   
    SELECT column_list
FROM table_name
WHERE column_name OPERATOR value_expression;*/
  -- EXAMPLE 
      SELECT name, goal
FROM running_goals
WHERE goal = 40;
/* +---------+------+
| name    | goal |
+---------+------+
| Bridget |   40 |
| Leslie  |   40 |
+---------+------+*/
/*  The <> operator tests whether two values are not equivalent,
 so this query returns every row whose goal value is not equal to 40*/ 
   SELECT name, goal
FROM running_goals
WHERE goal <> 40;
/*Output
+----------+------+
| name     | goal |
+----------+------+
| Michelle |   55 |
| Jerry    |   25 |
| Milton   |   45 |
| Wanda    |   30 |
| Stewart  |   35 |
+----------+------+*/
/*The < operator tests whether the first value expression is less than the second*/
   SELECT name, goal
FROM running_goals
WHERE goal < 40;
   /*Output
+---------+------+
| name    | goal |
+---------+------+
| Jerry   |   25 |
| Wanda   |   30 |
| Stewart |   35 |
+---------+------+*/ 
/*The > operator tests whether the first value expression is greater than the second*/
   SELECT name, goal
FROM running_goals
WHERE goal > 40;
/*Output
+----------+------+
| name     | goal |
+----------+------+
| Michelle |   55 |
| Milton   |   45 |
+----------+------+*/
/*The <= operator tests whether the first value is less than or equal to the second:*/
  SELECT name, goal
FROM running_goals
WHERE goal <= 40;
   /*Output
+---------+------+
| name    | goal |
+---------+------+
| Jerry   |   25 |
| Bridget |   40 |
| Wanda   |   30 |
| Stewart |   35 |
| Leslie  |   40 |
+---------+------+*/
/*The >= operator tests whether the first value is greater than or equal to the second*/
SELECT name, goal
FROM running_goals
WHERE goal >= 40;
/*Output
+----------+------+
| name     | goal |
+----------+------+
| Michelle |   55 |
| Milton   |   45 |
| Bridget  |   40 |
| Leslie   |   40 |
+----------+------+*/

/*The equivalence (=) and inequivalence (<>) operators work with string values as one might expect.
 The following query returns every row’s name value that’s equal to 'Leslie' */
 SELECT name
FROM running_goals
WHERE name = 'Leslie';
/* Output
+--------+
| name   |
+--------+
| Leslie |
+--------+*/ 

/*To illustrate, run the following query. 
This will return the name and goal values of every row whose name value is “less than” the letter 'M'. 
In other words, the search condition will evaluate to “true” for every row whose name value comes before M alphabetically*/
SELECT name
FROM running_goals
WHERE name < 'M';
/*Output
+---------+
| name    |
+---------+
| Jerry   |
| Bridget |
| Leslie  |
+---------+*/
                   ------------------------Null Predicates----------------------------
				   /*. . . 
WHERE column_name IS NULL
. . .*/   
     -- EXAPLE 
	 SELECT name, result
FROM running_goals
WHERE result IS NULL;  
/* Output
+---------+--------+
| name    | result |
+---------+--------+
| Jerry   |   NULL |
| Bridget |   NULL |
| Stewart |   NULL |
+---------+--------+*/
              