{{ config( materialized = 'incremental', unique_key = 'ORDERID') }}
SELECT ORDERID,
       ORDERDATE,
       CUSTOMERID,
       EMPLOYEEID,
       STOREID,
       STATUS AS STATUSCD,
       CASE WHEN STATUS = '01' THEN 'In Progress'
            WHEN STATUS = '02' THEN 'Completed'
            WHEN STATUS = '03' THEN 'Cancelled'
            ELSE 'Unknown' END AS STATUSDESC,
        CASE WHEN STOREID = 1000 then 'Online'
             ELSE 'In-store'
        END AS ORDER_CHANNEL,
       updated_at,
       CURRENT_TIMESTAMP AS DBT_UPDATED_AT
 FROM {{ source("landing", 'orders')}}