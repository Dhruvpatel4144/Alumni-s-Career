# Project 2 - SQL
/*
Question

Q1 Once a student is passed out from a Institute or College, he/she is known as Alumni of the Institute. Alumni’s career growth 
plays important role in Institute’s ranking and other networking activities. In this project, career choices of alumni of
two Universities will be analyzed with respect to their passing year as well as the course they completed. 

Dataset: Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed and Service/Job record 

College_A_HS ~ Higher Studies Record of College A
College_A_SE ~ Self Employed Record of College A
College_A_SJ ~ Service/Job Record of College A
College_B_HS ~ Higher Studies Record of College B
College_B_SE ~ Higher Studies Record of College B
College_B_SJ ~ Higher Studies Record of College B

Tasks to be performed

1. Create new schema as alumni
2. Import all .csv files into MySQL
3. Run SQL command to see the structure of six tables
4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.
5. Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.
6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 
7. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.
8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.
10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.
11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.

12. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views 
(College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

13. Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
into MS Excel and make pivot chart for location of Alumni. 

14. Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.
 
15. Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.
16. Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
Note: Approximate percentages are considered for career choices.

*/

# 1. Create new schema as alumni

create database alumni;
show databases;

# 2. Import all .csv files into MySQL

use alumni;
show tables;

# 3. Run SQL command to see the structure of six tables

desc college_a_hs;
desc college_a_se;
desc college_a_sj;
desc college_b_hs;
desc college_b_se;
desc college_b_sj;

# 4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.

-- done in python 

# 6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 

select count(RollNo) from college_a_hs;
select count(LastUpdate) from college_a_hs;
select count(Name) from college_a_hs;
select count(FatherName) from college_a_hs;
select count(MotherName) from college_a_hs;
select count(Batch) from college_a_hs;
select count(Degree) from college_a_hs;
select count(PresentStatus) from college_a_hs;
select count(HSDegree) from college_a_hs;
select count(EntranceExam) from college_a_hs;  -- null value 1155 outof 1157
select count(Institute) from college_a_hs;
select count(Location) from college_a_hs;


select * from college_a_hs where EntranceExam is null;   -- there are two entry with null value , we need to remove it

-- OR

create or replace view college_a_hs_v as select * from college_a_hs
where RollNo is not null and LastUpdate is not null and Name is not null 
and FatherName is not null and MotherName is not null and Batch is not null
and Degree is not null and PresentStatus is not null and HSDegree is not null
and EntranceExam is not null and Institute is not null and Location is not null;

select * from college_a_hs_v;

# 7. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.

select count(RollNo) from college_a_se;        -- 724
select count(LastUpdate) from college_a_se;    -- 724
select count(Name) from college_a_se;          -- 724
select count(FatherName) from college_a_se;    -- 724
select count(MotherName) from college_a_se;    -- 724
select count(Batch) from college_a_se;         -- 724
select count(Degree) from college_a_se;        -- 724
select count(PresentStatus) from college_a_se; -- 724
select count(Organization) from college_a_se;  -- 724
select count(Location) from college_a_se;      -- 724


-- OR

create or replace view college_a_se_v as select * from college_a_se where
RollNo is not null and LastUpdate is not null and Name is not null
and FatherName is not null and Mothername is not null and Batch is not null
and Degree is not null and PresentStatus is not null and Organization is not null
and Location is not null;

select * from college_a_se_v;

# 8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.

select count(RollNo) from college_a_sj;         -- 4003
select count(LastUpdate) from college_a_sj;
select count(Name) from college_a_sj;
select count(FatherName) from college_a_sj;
select count(MotherName) from college_a_sj;
select count(Batch) from college_a_sj;
select count(Degree) from college_a_sj;
select count(PresentStatus) from college_a_sj;
select count(Organization) from college_a_sj;
select count(Designation) from college_a_sj;  
select count(Location) from college_a_sj;


-- oR

create or replace view college_a_sj_v as select * from college_a_sj where
RollNo is not null and LastUpdate is not null and Name is not null 
and FatherName is not null and MotherName is not null and Batch is not null
and Degree is not null and PresentStatus is not null and Organization is not null
and Designation is not null and Location is not null;

select * from college_a_sj_v;


# 9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.

select count(RollNo) from college_b_hs;       -- 199
select count(LastUpdate) from college_b_hs;
select count(Name) from college_b_hs;
select count(FatherName) from college_b_hs;
select count(MotherName) from college_b_hs;
select count(Batch) from college_b_hs;
select count(Degree) from college_b_hs;
select count(PresentStatus) from college_b_hs;
select count(HSDegree) from college_b_hs;
select count(EntranceExam) from college_b_hs;  
select count(Institute) from college_b_hs;
select count(Location) from college_b_hs;

-- OR 

create or replace view college_b_hs_v as select * from college_b_hs
where RollNo is not null and LastUpdate is not null and Name is not null 
and FatherName is not null and MotherName is not null and Batch is not null
and Degree is not null and PresentStatus is not null and HSDegree is not null
and EntranceExam is not null and Institute is not null and Location is not null;

select * from college_b_hs_v;

# 10. Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.

select count(RollNo) from college_b_se;        -- 201
select count(LastUpdate) from college_b_se;    
select count(Name) from college_b_se;          
select count(FatherName) from college_b_se;    
select count(MotherName) from college_b_se;    
select count(Batch) from college_b_se;         
select count(Degree) from college_b_se;        
select count(PresentStatus) from college_b_se; 
select count(Organization) from college_b_se;  
select count(Location) from college_b_se;      

-- OR

create or replace view college_b_se_v as select * from college_b_se where
RollNo is not null and LastUpdate is not null and Name is not null
and FatherName is not null and Mothername is not null and Batch is not null
and Degree is not null and PresentStatus is not null and Organization is not null
and Location is not null;

select * from college_b_se_v;


# 11. Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.

select count(RollNo) from college_b_sj;         -- 1859
select count(LastUpdate) from college_b_sj;
select count(Name) from college_b_sj;
select count(FatherName) from college_b_sj;
select count(MotherName) from college_b_sj;
select count(Batch) from college_b_sj;
select count(Degree) from college_b_sj;
select count(PresentStatus) from college_b_sj;
select count(Organization) from college_b_sj;
select count(Designation) from college_b_sj;  
select count(Location) from college_b_sj;

-- OR

create or replace view college_b_sj_v as select * from college_b_sj where
RollNo is not null and LastUpdate is not null and Name is not null 
and FatherName is not null and MotherName is not null and Batch is not null
and Degree is not null and PresentStatus is not null and Organization is not null
and Designation is not null and Location is not null;

select * from college_b_sj_v;


# 12. Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views 
# (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

DELIMITER ||
create procedure lower_college()
begin

select RollNo, LastUpdate, lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName,
Batch, Degree, PresentStatus, HSDegree,EntranceExam, Institute Location from college_a_hs_v;

select RollNo, LastUpdate, lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName,
Batch, Degree, PresentStatus, Organization, Location from college_a_se_v;

select RollNo, LastUpdate, lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName, 
Batch, Degree, PresentStatus, Organization, Designation, Location from college_a_sj_v;

select RollNo, LastUpdate, lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName, 
Batch, Degree, PresentStatus, HSDegree,EntranceExam, Institute Location from college_b_hs_v;

select RollNo, LastUpdate, lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName, 
Batch, Degree, PresentStatus, Organization, Location from college_b_se_v;

select RollNo, LastUpdate, lower(Name) Name, lower(FatherName) FatherName, lower(MotherName) MotherName, 
Batch, Degree, PresentStatus, Organization, Designation, Location from college_b_sj_v;

end ||
DELIMITER ;

call lower_college();


# 13. Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
# into MS Excel and make pivot chart for location of Alumni. 

-- done in excel

# 14. Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.
 
	DELIMITER ||
    create procedure get_name_collegeA ()
    begin
    
    select Name from college_a_hs_v
    union
    select Name from college_a_se_v
    union
    select Name from college_a_sj_v;
    
    end ||
    DELIMITER ;
 
 call get_name_collegeA ()
 
# 15. Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.

	DELIMITER ||
    create procedure get_name_collegeB ()
    begin
    
    select Name from college_b_hs_v
    union
    select Name from college_b_se_v
    union
    select Name from college_b_sj_v;
    
    end ||
    DELIMITER ;
 
 call get_name_collegeB ();
 
# 16. Calculate the percentage of career choice of College A and College B Alumni
-- (w.r.t Higher Studies, Self Employed and Service/Job)
-- Note: Approximate percentages are considered for career choices.

select 'Higher Studies' PresentStatus, (Select count(*) from college_a_hs)/
((select count(*) from college_a_hs) + (select count(*) from college_a_se) + (select count(*) from college_a_sj))*100 
Percentage_College_A,
(select count(*) from college_b_hs)/
((select count(*) from college_b_hs) + (select count(*) from college_b_se) + (select count(*) from college_b_sj))*100
Percentage_College_B

union

select 'Self Employed' PresentStatus, (Select count(*) from college_a_se)/
((select count(*) from college_a_hs) + (select count(*) from college_a_se) + (select count(*) from college_a_sj))*100 
Percentage_College_A,
(select count(*) from college_b_se)/
((select count(*) from college_b_hs) + (select count(*) from college_b_se) + (select count(*) from college_b_sj))*100
Percentage_College_B

union

select 'Service JObs' PresentStatus, (Select count(*) from college_a_sj)/
((select count(*) from college_a_hs) + (select count(*) from college_a_se) + (select count(*) from college_a_sj))*100 
Percentage_College_A,
(select count(*) from college_b_sj)/
((select count(*) from college_b_hs) + (select count(*) from college_b_se) + (select count(*) from college_b_sj))*100
Percentage_College_B;
