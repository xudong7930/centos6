drop continuous query "ACAG_1m" on "jdm";
 
CREATE CONTINUOUS QUERY ACAG_1m ON jdm
RESAMPLE EVERY 2s FOR 4m 
BEGIN 
  SELECT first(last) AS open, last(last) AS close, last(buy) AS buy, last(sell) AS sell, max(last) AS high, min(last) AS low, sum(volume) AS volume INTO jdm.autogen."1m_ACAG" FROM jdm."15_day"."1s_ACAG" GROUP BY time(1m), * fill(previous)
END
