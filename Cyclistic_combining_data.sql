-- combining data to 2021_combined table

DROP TABLE IF EXISTS `2021.2021_combined`;

CREATE TABLE IF NOT EXISTS `2021.2021_combined` AS (
  SELECT * FROM `2021.JAN`
  UNION ALL
  SELECT * FROM `2021.FEB`
  UNION ALL
  SELECT * FROM `2021.MAR`
  UNION ALL
  SELECT * FROM `2021.APR`
  UNION ALL
  SELECT * FROM `2021.MAY`
  UNION ALL
  SELECT * FROM `2021.JUN`
  UNION ALL
  SELECT * FROM `2021.JUL`
  UNION ALL
  SELECT * FROM `2021.AUG`
  UNION ALL
  SELECT * FROM `2021.SEP`
  UNION ALL
  SELECT * FROM `2021.OCT`
  UNION ALL
  SELECT * FROM `2021.NOV`
  UNION ALL
  SELECT * FROM `2021.DEC`
);

