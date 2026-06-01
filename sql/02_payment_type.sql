SELECT
  "Payment Format",
  COUNT(*) AS total_transactions,
  SUM("Is Laundering") AS flagged_transactions,
  ROUND(AVG("Amount Paid"), 2) AS avg_amount,
  ROUND(SUM("Is Laundering") * 100.0 / COUNT(*), 2) AS flag_rate_pct
FROM aml_transactions
GROUP BY "Payment Format"
ORDER BY flagged_transactions DESC;