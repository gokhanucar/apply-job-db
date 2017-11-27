
CONNECT system/system;
SET SERVEROUTPUT ON;

CREATE USER isbul IDENTIFIED BY 1988 DEFAULT TABLESPACE users;
GRANT ALL PRIVILEGES TO isbul;

CONNECT isbul/1988;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE sirketler';
  EXECUTE IMMEDIATE 'DROP TABLE basvurular';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE sirketler
(
  sirket_id NUMBER,
  sirket_ismi VARCHAR2(200) NOT NULL UNIQUE,
  CONSTRAINT sirket_id_pk PRIMARY KEY (sirket_id)
);

CREATE TABLE pozisyonlar
(
  pozisyon_id NUMBER,
  pozisyon_adi VARCHAR2(100) NOT NULL,
  CONSTRAINT pozisyon_id PRIMARY KEY (pozisyon_id)
);

CREATE TABLE sirket_pozisyon
(
  sirket_id NUMBER NOT NULL,
  pozisyon_id NUMBER NOT NULL,
  CONSTRAINT sirket_id_fk FOREIGN KEY (sirket_id)
      REFERENCES sirketler (sirket_id),
  CONSTRAINT pozisyon_id_fk FOREIGN KEY (pozisyon_id)
      REFERENCES pozisyonlar (pozisyon_id)
);

DROP TABLE basvurular;

CREATE TABLE basvurular
(
  basvuru_id        NUMBER,
  sirket_id         NUMBER           NOT NULL,
  pozisyon_id       NUMBER           NOT NULL,
  basvuru_platformu VARCHAR2(50)     NOT NULL,
  basvuru_sekli     VARCHAR2(50),
  basvuru_tarihi    DATE                        DEFAULT SYSDATE,
  gorusme           VARCHAR2(20CHAR) NOT NULL,
  CONSTRAINT basvuru_id_pk PRIMARY KEY (basvuru_id),
  CONSTRAINT sirket_basvuru_fk FOREIGN KEY (sirket_id) REFERENCES sirketler (sirket_id),
  CONSTRAINT pozisyon_basvuru_fk FOREIGN KEY (pozisyon_id) REFERENCES pozisyonlar (pozisyon_id)
);

CREATE SEQUENCE sirket_id_seq
  START WITH 2
  INCREMENT BY 1
  MAXVALUE 100
  NOCACHE;

CREATE SEQUENCE pozisyon_id_seq
  START WITH 2
  INCREMENT BY 1
  MAXVALUE 100
  NOCACHE;
  
CREATE SEQUENCE basvuru_id_seq
START WITH 2
INCREMENT BY 1
MAXVALUE 100
NOCACHE;