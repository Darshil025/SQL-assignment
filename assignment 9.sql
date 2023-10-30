create database exercise_9db;
use exercise_9db;

create table cran_log_tbl(
date_value date,
time_value time,
size int,
r_version varchar(12),
r_arch varchar(12),
r_os varchar(12),
package varchar(30),
version varchar(20),
country char(2),
ip_id int 
);

select * from `cran_logs_2015-01-01`;
-- 9.1 give the total number of recordings in this table?
select count(*) from `cran_logs_2015-01-01`;
-- 9.2 the number of packages listed in this table?
SELECT count(package) FROM `cran_logs_2015-01-01`;

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(package) as "No of rcpp" from `cran_logs_2015-01-01` where country ="cn";

-- 9.4 How many recordings are from China ("CN")?
SELECT * FROM `cran_logs_2015-01-01` WHERE country = 'CN';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
SELECT 
    package, count(*)
FROM
    `cran_logs_2015-01-01`
GROUP BY package
ORDER BY 2 DESC;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select package,
case 
when count(package) between 1 and 200 then"A"
when count(package) between 200 and 400 then"B"
when count(package) between 401 and 600 then"C"
when count(package) between 601 and 800 then"D"
else"E"
end as ranking
from `cran_logs_2015-01-01` where time_value between 09 and 11
group by package; 


-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
SELECT * FROM `cran_logs_2015-01-01`
WHERE country in ('CN', 'JP', 'SG');

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")


-- 9.9 Print the average length of the package name of all the UNIQUE packages
select avg(char_length(package)) from `cran_logs_2015-01-01`group by package;

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select package,count(package) as count_package from `cran_logs_2015-01-01` group by package order by count_package desc limit 1,1;

-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package from `cran_logs_2015-01-01` group by package having count(*)> 1000;

-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage)
select r_os, count(r_os) from `cran_logs_2015-01-01` where r_os!="NA" group by r_os;