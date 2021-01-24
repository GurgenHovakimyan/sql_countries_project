-- left join of cities, countries, area and independce year
select countries.name as country, cities.name as capital_city, 
countries.region as region, countries.surface_area as area,
countries.indep_year as independence_year
from cities
left join countries 
on cities.country_code = countries.code
-- country doesn't work for where statement that's why I wrote countries.name
where countries.name is not null
and 
--- if we will not att this row we will have same country with different cities repeated
cities.name = countries.capital 
order by 
	independence_year desc,
	area ASC;


-- self join of economical situation
select e1.code as country, e1.gdp_percapita as gdp_2010,
e2.gdp_percapita as gdp_2015, e1.exports as export_2010, e2.exports as export_2015, 
e1.imports as imports_2010, e2.imports as imports_2015,
case 
when e1.exports > e2.exports then 'dicrease_of_export'
when e1.exports = e2.exports then 'stable'
else 'increase_of_export'
end as export_change,
case 
when e1.imports > e2.imports then 'dicrease_of_import'
when e1.imports = e2.imports then 'stable'
else 'increase_of_import'
end as import_change,
((e2.gdp_percapita - e1.gdp_percapita)/e1.gdp_percapita)*100 as gdp_change
from economies e1
join economies e2
using(code)
where e1.year = 2010 and e2.year = 2015 and e1.gdp_percapita is not null and e2.gdp_percapita is not null 
order by gdp_change desc;
-- Armenia is in 84th place 12% increase in gdp from 2010->2015

-- grouping by languages in country and counting number of languages
select code as country, count(*) as number_of_languages
from languages l 
group by code
order by number_of_languages desc;

select code as country, count(*) as number_of_languages
from languages l 
where l.code = 'ARM'
or l.code = 'GEO' or l.code = 'AZE'
group by code
order by number_of_languages desc;

-- calculating  average life expectancy in middle east (Armenia is here)
select c.name as country, c.region as region, AVG( p.fertility_rate )as fertility_rate , 
AVG(p.life_expectancy) as life_exp, AVG(p.size) as population
from countries c
left join 
populations p
on c.code = p.country_code 
group by c.name, c.region
having c.region = 'Middle East'
order by population desc;

-- counting usage of currencies
select curr_code, count(*) as usage
from currencies 
group by curr_code
having count(*) >= 2
order by usage desc;

-- returning biggest surface area and size for each region for 2015 year and calculating 
select name, region, surface_area, size as population,
(size/ surface_area) as population_density
from countries
left join populations 
on countries.code = populations.country_code
where surface_area in(select MAX(surface_area) 
from countries
group by region) 
and populations.year = 2015
order by population_density desc;


-- partition by region
select distinct(region),  MIN(surface_area) over (partition by region) as minimum_surface_area,
AVG(surface_area) over (partition by region) as average_surface_area,
MAX(surface_area) over (partition by region) as maximum_surface_area
from countries;


-- subquery in from statement for counting usage of currencies
select countries.name as country, sub.currency as currency_count
from countries,
(SELECT code, COUNT(*) AS currency
  	 FROM currencies 
  	 GROUP BY code
  	 having count(*) >= 2) AS sub
  WHERE countries.code = sub.code
ORDER BY currency_count desc;



