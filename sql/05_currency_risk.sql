SELECT
  "Payment Currency",
  "Receiving Currency",
  COUNT(*) AS transactions,
  SUM("Is Laundering") AS flagged,
  ROUND(AVG("Amount Paid"), 2) AS avg_amount,
  ROUND(SUM("Is Laundering") * 100.0 / COUNT(*), 2) AS flag_rate_pct
FROM aml_transactions
GROUP BY "Payment Currency", "Receiving Currency"
ORDER BY flagged DESC
LIMIT 30;