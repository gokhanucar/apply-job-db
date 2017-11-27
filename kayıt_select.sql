SELECT basvuru_id AS "BA�VURU NO",
       sirket_ismi AS "��RKET ADI",
       basvuru_platformu AS "BA�VURU PLATFORMU",
       basvuru_sekli AS "BA�VURU �EKL�",
       basvuru_tarihi AS "BA�VURU TAR�H�",
       gorusme AS "G�R��ME DURUMU"
FROM basvurular JOIN sirketler ON sirketler.sirket_id = basvurular.sirket_id
ORDER BY "BA�VURU NO";
                