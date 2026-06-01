SELECT
  CASE
    WHEN "Amount Paid" >= 10000 THEN 'Large (10k+)'
    WHEN "Amount Paid" >= 1000 THEN 'Medium (1k-10k)'
    ELSE 'Small (under 1k)'
  END AS transaction_size,
  COUNT(*) AS total,
  SUM("Is Laundering") AS flagged,
  ROUND(SUM("Is Laundering") * 100.0 / COUNT(*), 2) AS flag_rate_pct,
  ROUND(AVG("Amount Paid"), 2) AS avg_amount
FROM aml_transactions
GROUP BY transaction_size
ORDER BY avg_amount DESC;