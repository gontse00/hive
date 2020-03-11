USE financials;

set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition=true;
DROP TABLE IF EXISTS prices_partitioned;
CREATE TABLE IF NOT EXISTS prices_partitioned (
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
PARTITIONED BY (ticker STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
DESCRIBE prices_partitioned;

INSERT INTO TABLE prices_partitioned PARTITION (ticker) 
SELECT date_time,open,high,low,close,volume,ex_div,split_ratio,adj_open,adj_high,adj_low,adj_close,adj_volume,
ticker FROM prices;