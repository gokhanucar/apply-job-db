INSERT INTO sirketler
  VALUES (sirket_id_seq.NEXTVAL, 'sirket adi');
  
INSERT INTO pozisyonlar
  VALUES (pozisyon_id_seq.NEXTVAL, '.Net Developer');
  
INSERT INTO sirket_pozisyon
  VALUES (sirket_id_seq.CURRVAL, pozisyon_id_seq.CURRVAL);
  
INSERT INTO basvurular
  VALUES (basvuru_id_seq.NEXTVAL, sirket_id_seq.CURRVAL, pozisyon_id_seq.CURRVAL,
         'Kariyer.net', 'Sistem �zerinden', default , 'hay�r'); 
         
COMMIT;

DELETE FROM sirketler
  WHERE sirket_id = 21;

UPDATE pozisyonlar
SET pozisyon_adi = 'Yaz�l�m M�hendisi'
WHERE pozisyon_id = 10;
