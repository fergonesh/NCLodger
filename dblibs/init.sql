CREATE SEQUENCE ACC_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE ACCOMMODATION
(
  ID_ACC INTEGER PRIMARY KEY NOT NULL,
  ID_HOTEL INTEGER NOT NULL,
  PRICE INTEGER NOT NULL,
  QUANTITY INTEGER,
  TYPE VARCHAR2(50)
);

CREATE TRIGGER ACC_SEQ
BEFORE INSERT ON ACCOMMODATION FOR EACH ROW
  BEGIN

    IF :NEW.ID_ACC IS NULL THEN
      SELECT ACC_SEQ.NEXTVAL
      INTO :NEW.ID_ACC
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE CE_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE CONFIRM
(
  ID_CE INTEGER PRIMARY KEY NOT NULL,
  ID_USER INTEGER NOT NULL,
  CONFIRM_HASH VARCHAR2(32) NOT NULL,
  DATE_C DATE NOT NULL
);

CREATE TRIGGER CE_SEQ
BEFORE INSERT ON CONFIRM FOR EACH ROW
  BEGIN

    IF :NEW.ID_CE IS NULL THEN
      SELECT CE_SEQ.NEXTVAL
      INTO :NEW.ID_CE
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE DR_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE DISCOUNT
(
  ID_DC INTEGER PRIMARY KEY NOT NULL,
  NAME_DC VARCHAR2(12) NOT NULL,
  VALUE INTEGER NOT NULL
);

CREATE TRIGGER DR_SEQ
BEFORE INSERT ON DISCOUNT FOR EACH ROW
  BEGIN

    IF :NEW.ID_DR IS NULL THEN
      SELECT DR_SEQ.NEXTVAL
      INTO :NEW.ID_DR
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE H_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE HOTEL
(
  ID_HOTEL INTEGER PRIMARY KEY NOT NULL,
  NAME_H VARCHAR2(20) NOT NULL,
  LOC_LAT INTEGER,
  LOC_LNG INTEGER,
  CATEGORY INTEGER,
  ID_SM INTEGER NOT NULL,
  CITY VARCHAR2(30),
  COUNTRY VARCHAR2(20)
);

CREATE TRIGGER H_SEQ
BEFORE INSERT ON HOTEL FOR EACH ROW
  BEGIN

    IF :NEW.ID_HOTEL IS NULL THEN
      SELECT H_SEQ.NEXTVAL
      INTO :NEW.ID_HOTEL
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE ORDER_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE "ORDER"
(
  ID_ORDER INTEGER PRIMARY KEY NOT NULL,
  ID_USER INTEGER NOT NULL,
  DATE_ORDER DATE NOT NULL,
  ID_ACC INTEGER NOT NULL,
  PRICE INTEGER NOT NULL,
  START_DATE DATE NOT NULL,
  END_DATE DATE NOT NULL,
  ID_PC INTEGER NOT NULL,
  DISCOUNT INTEGER,
  ID_SM INTEGER NOT NULL
);

CREATE TRIGGER ORDER_SEQ
BEFORE INSERT ON ORDER FOR EACH ROW
  BEGIN

    IF :NEW.ID_ORDER IS NULL THEN
      SELECT ORDER_SEQ.NEXTVAL
      INTO :NEW.ID_ORDER
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE PROMO_SEQ START WITH 1
INCREMENT BY 1;


CREATE TABLE PROMOCODE
(
  ID_PC INTEGER PRIMARY KEY NOT NULL,
  CODE VARCHAR2(20) NOT NULL,
  START_DATE DATE NOT NULL,
  END_DATE DATE NOT NULL,
  DISCOUNT INTEGER NOT NULL,
  ISUSED INTEGER,
  ID_SM INTEGER NOT NULL
);

CREATE TRIGGER PROMO_SEQ
BEFORE INSERT ON PROMOCODE FOR EACH ROW
  BEGIN

    IF :NEW.ID_PC IS NULL THEN
      SELECT PROMO_SEQ.NEXTVAL
      INTO :NEW.ID_PC
      FROM dual;
    END IF;
  END;
/

CREATE SEQUENCE SM_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE MANAGER
(
  ID_SM INTEGER PRIMARY KEY NOT NULL,
  ID_USER INTEGER
);

CREATE TRIGGER SM_SEQ
BEFORE INSERT ON MANAGER FOR EACH ROW
  BEGIN

    IF :NEW.ID_USER IS NULL THEN
      SELECT SM_SEQ.NEXTVAL
      INTO :NEW.ID_SM
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE SMHP_SEQ START WITH 1
INCREMENT BY 1;



CREATE TABLE HOTEL_MANAGER
(
  ID_SMHP INTEGER PRIMARY KEY NOT NULL,
  ID_HOTEL INTEGER NOT NULL,
  ID_SM INTEGER NOT NULL,
  COMMISSION INTEGER NOT NULL
);

CREATE TRIGGER SMHP_SEQ
BEFORE INSERT ON HOTEL_MANAGER FOR EACH ROW
  BEGIN

    IF :NEW.ID_SMHP IS NULL THEN
      SELECT SMHP_SEQ.NEXTVAL
      INTO :NEW.ID_SMHP
      FROM dual;
    END IF;
  END;
/

CREATE SEQUENCE USERS_SEQ START WITH 1
INCREMENT BY 1;

CREATE TABLE USERS
(
  ID_USER INTEGER PRIMARY KEY NOT NULL,
  EMAIL VARCHAR2(50) NOT NULL,
  PSWD VARCHAR2(32) NOT NULL,
  USERNAME VARCHAR2(20) NOT NULL,
  CONFIRM_REGISTER INTEGER NOT NULL,
  ID_UT INTEGER NOT NULL,
  IS_BLOCKED INTEGER NOT NULL,
  ID_DC INTEGER,
  ID_SM INTEGER
);

CREATE TRIGGER USERS_SEQ
BEFORE INSERT ON USERS FOR EACH ROW
  BEGIN

    IF :NEW.ID_USER IS NULL THEN
      SELECT USERS_seq.NEXTVAL
      INTO :NEW.ID_USER
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE UT_SEQ START WITH 1
INCREMENT BY 1;


CREATE TABLE TYPE
(
  ID_UT INTEGER PRIMARY KEY NOT NULL,
  NAME_T VARCHAR2(10) NOT NULL,
  ID_DC INTEGER
);

CREATE TRIGGER UT_SEQ
BEFORE INSERT ON TYPE FOR EACH ROW
  BEGIN

    IF :NEW.ID_UT IS NULL THEN
      SELECT UT_SEQ.NEXTVAL
      INTO :NEW.ID_UT
      FROM dual;
    END IF;
  END;
/


CREATE SEQUENCE UTC_SEQ START WITH 1
INCREMENT BY 1;


CREATE TABLE USER_TYPE
(
  ID_UTC INTEGER PRIMARY KEY NOT NULL,
  ID_USER INTEGER NOT NULL,
  ID_UT INTEGER NOT NULL
);

CREATE TRIGGER UTC_SEQ
BEFORE INSERT ON USER_TYPE FOR EACH ROW
  BEGIN

    IF :NEW.ID_UTC IS NULL THEN
      SELECT UTC_SEQ.NEXTVAL
      INTO :NEW.ID_UTC
      FROM dual;
    END IF;
  END;
/

ALTER TABLE ACCOMMODATION ADD FOREIGN KEY ( ID_HOTEL ) REFERENCES HOTEL ( ID_HOTEL );
ALTER TABLE CONFIRM ADD FOREIGN KEY ( ID_USER ) REFERENCES USERS ( ID_USER );
ALTER TABLE HOTEL ADD FOREIGN KEY ( ID_SM ) REFERENCES HOTEL ( ID_HOTEL );
ALTER TABLE HOTEL ADD FOREIGN KEY ( ID_SM ) REFERENCES MANAGER ( ID_SM );
ALTER TABLE "ORDER" ADD FOREIGN KEY ( ID_ACC ) REFERENCES ACCOMMODATION ( ID_ACC );
ALTER TABLE "ORDER" ADD FOREIGN KEY ( ID_PC ) REFERENCES PROMOCODE ( ID_PC );
ALTER TABLE "ORDER" ADD FOREIGN KEY ( ID_SM ) REFERENCES MANAGER ( ID_SM );
ALTER TABLE "ORDER" ADD FOREIGN KEY ( ID_USER ) REFERENCES USERS ( ID_USER );
ALTER TABLE PROMOCODE ADD FOREIGN KEY ( ID_SM ) REFERENCES MANAGER ( ID_SM );
ALTER TABLE MANAGER ADD FOREIGN KEY ( ID_USER ) REFERENCES USERS ( ID_USER );
ALTER TABLE HOTEL_MANAGER ADD FOREIGN KEY ( ID_HOTEL ) REFERENCES HOTEL ( ID_HOTEL );
ALTER TABLE HOTEL_MANAGER ADD FOREIGN KEY ( ID_SM ) REFERENCES MANAGER ( ID_SM );
ALTER TABLE USERS ADD FOREIGN KEY ( ID_DC ) REFERENCES DISCOUNT ( ID_DC );
ALTER TABLE USERS ADD FOREIGN KEY ( ID_SM ) REFERENCES SM ( ID_SM );
ALTER TABLE USERS ADD FOREIGN KEY ( ID_UT ) REFERENCES USERTYPE ( ID_UT );
CREATE UNIQUE INDEX "unique_EMAIL" ON USERS ( EMAIL );
ALTER TABLE TYPE ADD FOREIGN KEY ( ID_DC ) REFERENCES DISCOUNT ( ID_DC );
ALTER TABLE USER_TYPE ADD FOREIGN KEY ( ID_USER ) REFERENCES USERS ( ID_USER );
ALTER TABLE USER_TYPE ADD FOREIGN KEY ( ID_UT ) REFERENCES TYPE ( ID_UT );



INSERT INTO TYPE (ID_UT, NAME_T) VALUES (1,'customer');
INSERT INTO TYPE (ID_UT, NAME_T) VALUES (2,'salesmanager');
INSERT INTO TYPE (ID_UT, NAME_T) VALUES (3,'superadmin');