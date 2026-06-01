SELECT
  COUNT(*) AS total_transactions,
  SUM("Is Laundering") AS total_flagged,
  ROUND(SUM("Is Laundering") * 100.0 / COUNT(*), 2) AS pct_flagged
FROM aml_transactions;