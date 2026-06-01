SELECT
  Account AS sending_account,
  "From Bank" AS bank,
  COUNT(*) AS total_sent,
  SUM("Is Laundering") AS times_flagged,
  ROUND(SUM("Amount Paid"), 2) AS total_amount_sent,
  ROUND(SUM("Is Laundering") * 100.0 / COUNT(*), 2) AS flag_rate_pct
FROM aml_transactions
GROUP BY Account, "From Bank"
HAVING SUM("Is Laundering") > 0
ORDER BY times_flagged DESC
LIMIT 50;