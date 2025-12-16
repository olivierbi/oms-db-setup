SELECT O.ORDERID,
       O.ORDERDATE,
       O.CUSTOMERID,
       O.EMPLOYEEID,
       O.STOREID,
       O.STATUSCD,
       O.STATUSDESC,
       O.UPDATED_AT,
       COUNT(DISTINCT O.ORDERID) AS ORDERCOUNT,
       SUM(OI.TOTALPRICE) AS REVENUE
  FROM {{ ref('orders_stg') }} AS o
  JOIN {{ ref('orderitems_stg') }} AS oi
    ON o.ORDERID = oi.ORDERID
 GROUP BY ALL