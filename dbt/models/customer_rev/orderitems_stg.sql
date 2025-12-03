SELECT ORDERITEMID,
       ORDERID,
       PRODUCTID,
       QUANTITY,
       UNITPRICE,
       QUANTITY * UNITPRICE AS TOTALPRICE,
       UPDATED_AT
  FROM {{ source("landing", "orderitems") }}