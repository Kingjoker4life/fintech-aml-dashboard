SELECT
  SUBSTR(Timestamp, 1, 10) AS date,
  COUNT(*) AS total_transactions,
  SUM("Is Laundering") AS flagged,
  ROUND(SUM("Amount Paid"), 2) AS total_volume
FROM aml_transactions
GROUP BY date
ORDER BY date;