SELECT 
    z.ID AS Zakaznik_ID,
    z.Name AS Zakaznik_Name,
    z.Mesto AS Zakaznik_Mesto,
    z.Region AS Zakaznik_Region,
    z.Zeme AS Zakaznik_Zeme,
    dd.den AS Datum_Den,
    dd.mesic AS Datum_Mesic,
    dd.kvartal AS Datum_Kvartal,
    dd.rok AS Datum_Rok,
    p.Product AS Produkt_Nazev,
    p.Category AS Produkt_Kategorie,
    dc.Cena AS Cena,
    dc.Množství AS Mnozstvi
FROM 
    Data_Cube dc
JOIN 
    Dim_Zakaznik z ON dc.Dim_Zak = z.ID
JOIN 
    dim_datum dd ON dc.Dim_Cas = c.ID
JOIN 
    dim_product p ON dc.Dim_Prod = p.ID;


ALTER TABLE order_details
ADD CONSTRAINT constraint_name
FOREIGN KEY (dim_cas)
REFERENCES dim_datum (datum);


CREATE TABLE dim_datum
(
  datum SMALLDATETIME PRIMARY KEY,
  den SMALLINT,
  mesic SMALLINT,
  kvartal VARCHAR(4),
  rok SMALLINT
);

set datefirst 1
declare 
 @start_date datetime
 ,@end_date datetime
 ,@loop_day datetime
 ,@diff int
 ,@loop int

Select 
 @start_date = '19960101' 
,@end_date = '19981231'
,@loop = 0

select 
 @diff = datediff(dd,@start_date,@end_date)

while @loop <= @diff
begin
 select @loop_day = dateadd(dd,@loop,@start_date)
 insert into [dim_datum] 
 select
  @loop_day 
  ,datepart(dd,@loop_day)
  ,datepart(mm,@loop_day)
  ,'Q'+convert(varchar,datepart(qq,@loop_day))  
  ,datepart(yy,@loop_day)
  

 select
  @loop = @loop + 1  
end


SELECT CustomerID, ContactName, City, Region, Country
INTO dim_zakaznik
FROM Northwind..Customers;
