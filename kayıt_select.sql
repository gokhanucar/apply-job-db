SELECT basvuru_id AS "BAÞVURU NO",
       sirket_ismi AS "ÞÝRKET ADI",
       basvuru_platformu AS "BAÞVURU PLATFORMU",
       basvuru_sekli AS "BAÞVURU ÞEKLÝ",
       basvuru_tarihi AS "BAÞVURU TARÝHÝ",
       gorusme AS "GÖRÜÞME DURUMU"
FROM basvurular JOIN sirketler ON sirketler.sirket_id = basvurular.sirket_id
ORDER BY "BAÞVURU NO";
                