# Input
CREATE TABLE tcptracer_machine_0 (
    SRC_ADDR STRING,
    SRC_PORT INT,
    DST_ADDR STRING,
    DST_PORT INT,
    TX_BYTES INT,
    ELAPSED_TIME TIME
) WITH (
    'bcc-tool' = 'tcptracer',
    'parameters' = '-t -P 80',
    'host' = 'monitoring_machine_0',
);

SELECT SRC_ADDR, SRC_PORT, DST_ADDR, DST_PORT,  TX_BYTES, ELAPSED_TIME
FROM tcptracer_machine_0
WHERE order_time >= CURRENT_TIMESTAMP - INTERVAL '1' HOUR
GROUP BY customer_id





# Output
Tracing TCP connections to port 80...
SRC_ADDR     SRC_PORT     DST_ADDR      DST_PORT     TX_BYTES     ELAPSED_TIME
10.0.0.1     54123        172.217.7.142  80             1638         00:00:03.210
10.0.0.2     52798        172.217.7.142  80             2591         00:00:04.580
10.0.0.3     55733        172.217.7.142  80             1128         00:00:02.960