CREATE DATABASE IF NOT EXISTS financials;
USE financials;

DROP TABLE IF EXISTS prices;
CREATE TABLE IF NOT EXISTS prices (
    ticker    STRING,
    date_time    STRING,
    open    FLOAT,
    high    FLOAT,
    low    FLOAT,
    close    FLOAT,
    volume    FLOAT,
    ex_div    FLOAT,
    split_ratio    FLOAT,
    adj_open    FLOAT,
    adj_high    FLOAT,
    adj_low    FLOAT,
    adj_close    FLOAT,
    adj_volume    FLOAT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");
DESCRIBE prices;

LOAD DATA INPATH '/user/gontse/data/financial/prices/'
OVERWRITE INTO TABLE prices;

SELECT ticker, COUNT(*) 
FROM prices 
GROUP BY ticker
LIMIT 30;