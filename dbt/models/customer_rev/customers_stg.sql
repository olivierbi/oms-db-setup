SELECT CUSTOMERID,
       FIRSTNAME,
       LASTNAME,
       EMAIL,
       PHONE,
       ADDRESS,
       CITY,
       STATE,
       ZIPCODE,
       UPDATED_AT,
       CONCAT(FIRSTNAME, ' ', LASTNAME) AS CUSTOMERNAME
FROM {{ source('landing', 'customers') }}