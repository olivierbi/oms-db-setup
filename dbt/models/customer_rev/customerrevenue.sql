{{ config(materialized='table') }}
SELECT os.customerid,
       cs.customername,
       SUM(os.ordercount) AS ordercount,
       SUM(os.revenue) AS revenue
  FROM {{ ref('orders_fact') }} AS os
  JOIN {{ ref('customers_stg') }} AS cs
    ON os.CUSTOMERID = cs.CUSTOMERID
 GROUP BY ALL