CREATE TABLE IF NOT EXISTS cities (
  name                    VARCHAR   PRIMARY KEY,
  country_code            VARCHAR,
  city_proper_pop         REAL,
  metroarea_pop           REAL,
  urbanarea_pop           REAL
);

CREATE TABLE IF NOT EXISTS countries (
  code                  VARCHAR     PRIMARY KEY,
  name                  VARCHAR,
  continent             VARCHAR,
  region                VARCHAR,
  surface_area          REAL,
  indep_year            INTEGER,
  local_name            VARCHAR,
  gov_form              VARCHAR,
  capital               VARCHAR,
  cap_long              REAL,
  cap_lat               REAL
);


CREATE TABLE IF NOT EXISTS languages (
  lang_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  name                  VARCHAR,
  percent               REAL,
  official              BOOLEAN
);

CREATE TABLE IF NOT EXISTS economies (
  econ_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  year                  INTEGER,
  income_group          VARCHAR,
  gdp_percapita         REAL,
  gross_savings         REAL,
  inflation_rate        REAL,
  total_investment      REAL,
  unemployment_rate     REAL,
  exports               REAL,
  imports               REAL
);

CREATE TABLE IF NOT EXISTS currencies (
  curr_id               INTEGER     PRIMARY KEY,
  code                  VARCHAR,
  basic_unit            VARCHAR,
  curr_code             VARCHAR,
  frac_unit             VARCHAR,
  frac_perbasic         REAL
);

CREATE TABLE IF NOT EXISTS populations (
  pop_id                INTEGER     PRIMARY KEY,
  country_code          VARCHAR,
  year                  INTEGER,
  fertility_rate        REAL,
  life_expectancy       REAL,
  size                  REAL
);


CREATE TABLE IF NOT EXISTS countries_plus (
  name                  VARCHAR,
  continent             VARCHAR,
  code                  VARCHAR     PRIMARY KEY,
  surface_area          REAL,
  geosize_group         VARCHAR
);

CREATE TABLE IF NOT EXISTS economies2010 (
  code                  VARCHAR     PRIMARY KEY,
  year                  INTEGER,
  income_group          VARCHAR,
  gross_savings         REAL
);

CREATE TABLE IF NOT EXISTS economies2015 (
  code                  VARCHAR     PRIMARY KEY,
  year                  INTEGER,
  income_group          VARCHAR,
  gross_savings         REAL
);

-- Copy over data from CSVs
copy cities FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\cities.csv' DELIMITER ',' CSV HEADER;
copy countries FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\countries.csv' DELIMITER ',' CSV HEADER;
copy languages FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\languages.csv' DELIMITER ',' CSV HEADER;
copy economies FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\economies.csv' DELIMITER ',' CSV HEADER;
copy economies2010 FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\economies2010.csv' DELIMITER ',' CSV HEADER;
copy economies2015 FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\economies2015.csv' DELIMITER ',' CSV HEADER;
copy currencies FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\currencies.csv' DELIMITER ',' CSV HEADER;
copy populations FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\populations.csv' DELIMITER ',' CSV HEADER;
copy countries_plus FROM 'C:\Users\Gurgen\Desktop\Master Degree\1 course\1 half\Data Base Management System\Final_Project\countries\countries_plus.csv' DELIMITER ',' CSV HEADER;






