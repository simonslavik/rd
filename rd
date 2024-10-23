SELECT 
    z.ID AS Zakaznik_ID,
    z.Name AS Zakaznik_Name,
    z.Mesto AS Zakaznik_Mesto,
    z.Region AS Zakaznik_Region,
    z.Zeme AS Zakaznik_Zeme,
    c.Den AS Datum_Den,
    c.Mesic AS Datum_Mesic,
    c.Ctvrtleti AS Datum_Ctvrtleti,
    c.Rok AS Datum_Rok,
    p.Product AS Produkt_Nazev,
    p.Category AS Produkt_Kategorie,
    dc.Cena AS Cena,
    dc.Množství AS Mnozstvi
FROM 
    Data_Cube dc
JOIN 
    Dim_Zakaznik z ON dc.Dim_Zak = z.ID
JOIN 
    Dim_Cas c ON dc.Dim_Cas = c.ID
JOIN 
    Dim_Product p ON dc.Dim_Prod = p.ID;
