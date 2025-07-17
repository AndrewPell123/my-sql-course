SELECT
    p.PropertyType
    ,count(PropertyType) AS 'NumberOfSales'
FROM
    PricePaidSW12 p

GROUP BY p.PropertyType
order by [NumberOfSales] DESC

SELECT
    sum(P.Price)/1000000 AS 'TotalMarketValue'
    ,YEAR(P.TransactionDate) AS 'YearOfSale'
    ,count(*) AS 'NumberOfSales'
FROM
    PricePaidSW12 p

    GROUP BY YEAR(P.TransactionDate)

ORDER BY 'YearOfSale' ASC

SELECT *
FROM
    PricePaidSW12

SELECT *

    from PricePaidSW12 p

    where p.Price between '400000' and '500000'

    and YEAR(P.TransactionDate)  = '2018'

    and p.Street = 'Cambray Road'

select TOP 25 TransactionDate
,p.Price
,p.Postcode
,p.PAON
,p.propertytype 

FROM PricePaidSW12 p

where p.Street = 'Ormeley Road'

order by TransactionDate DESC

select TOP 25 TransactionDate
,p.Price
,p.Postcode
,p.PAON
,pt.propertytypename
FROM PricePaidSW12 p left join PropertyTypeLookup pt on p.PropertyType = pt.PropertyTypeCode

where p.Street = 'Ormeley Road'

order by TransactionDate DESC

--temp table

drop table if exists #TempPatientStay

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Tariff  
    ,CASE WHEN ps.Tariff >= 7 THEN 'High Tariff'
        WHEN ps.Tariff >= 4 THEN 'Medium Tariff'
        ELSE 'Low Tariff'
    END AS TariffGroup
INTO #TempPatientStay
FROM
    dbo.PatientStay ps
 
SELECT
    p.TariffGroup
    ,COUNT(*) AS NumberOfPatients
FROM #TempPatientStay AS p
GROUP BY p.TariffGroup
ORDER BY p.TariffGroup;
 
 