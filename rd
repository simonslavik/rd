Select nazevfirmy, vlozeno, nazevzbozi, cenazajednotku, prodejnicenazaj, marze, nasklade,nasklade*cenazajednotku as 'hodnotaskladu', zz.ZboziKategorie, nazevkategorie
from Dodavatel.Identifikace di
JOIN Dodavatel.Zbozi dz on di.DodavatelID = Dz.DodavatelID
Join Zbozi.Zbozi zz on dz.ZboziID = zz.ZboziID
Join Zbozi.Kategorie zk on zz.ZboziKategorie = zk.ZboziKategorie
where nasklade > 5 and year(vlozeno)='2023'
group by nazevfirmy, vlozeno, nazevzbozi, cenazajednotku, prodejnicenazaj, marze, nasklade,nasklade, cenazajednotku , zz.ZboziKategorie, nazevkategorie
having marze>= (select Avg(marze) from zbozi.zbozi)
