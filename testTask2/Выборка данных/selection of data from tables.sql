SELECT *
from zajavka
where date between '2012-01-01' and '2012-01-31';


SELECT abon_name.name, phone_volume.io
from abon_name
         join phone_volume on
    abon_name.id_name = phone_volume.id_name;
	
	
SELECT *
from (SELECT type_phone.name, count(phone_volume.id_type) as phoneCount
      from type_phone
               inner join phone_volume on type_phone.id_type = phone_volume.id_type
      group by phone_volume.id_type) as quantity
where phoneCount <= 2;


SELECT phone
FROM zajavka
WHERE NOT EXISTS(SELECT phone, id_abonent, id_type from phone_volume
WHERE zajavka.phone = phone_volume.phone);


SELECT Result.phone, max(countZajavka)
from (SELECT phone, COUNT(phone) as countZajavka
      from zajavka
      group by phone
     ) as Result;
	 
	 
SELECT phone, max_countZajavka
FROM (
         SELECT phone, COUNT(phone) AS countZajavka
         FROM zajavka
         GROUP BY phone
     ) AS v_1,
     (SELECT MAX(countZajavka) AS max_countZajavka
      from (select phone, count(phone) AS countZajavka
            FROM zajavka
            GROUP BY phone
           ) AS v_0
     ) AS v_2
WHERE v_1.countZajavka = v_2.max_countZajavka;