--------------------------------------------------------
-- Archivo creado  - martes-mayo-16-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_POSTS
--------------------------------------------------------

   CREATE SEQUENCE  "FORO"."SEQ_POSTS"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 12 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USERS
--------------------------------------------------------

   CREATE SEQUENCE  "FORO"."SEQ_USERS"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table POSTS
--------------------------------------------------------

  CREATE TABLE "FORO"."POSTS" 
   (	"ID" NUMBER(19,0), 
	"TITLE" VARCHAR2(255 BYTE), 
	"CONTENT" CLOB, 
	"USER_ID" NUMBER(19,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "FORO"."USERS" 
   (	"ID" NUMBER(19,0), 
	"USERNAME" VARCHAR2(255 BYTE), 
	"PASSWORD" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into FORO.POSTS
SET DEFINE OFF;
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('6','Integral Calculation','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('3','Hola','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('5','Integral Calculation','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('7','Integral Calculation','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('8','Integral Calculation','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('9','Integral Calculation','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('10','Integral Calculation','2');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('11','Response to Integral Calculation','3');
Insert into FORO.POSTS (ID,TITLE,USER_ID) values ('4','Integral Calculation','2');
REM INSERTING into FORO.USERS
SET DEFINE OFF;
Insert into FORO.USERS (ID,USERNAME,PASSWORD) values ('2','fbosas','bosa123');
Insert into FORO.USERS (ID,USERNAME,PASSWORD) values ('3','GPT-3','password');
--------------------------------------------------------
--  DDL for Index POSTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORO"."POSTS_PK" ON "FORO"."POSTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FORO"."USERS_PK" ON "FORO"."USERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TRG_INS_POSTS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "FORO"."TRG_INS_POSTS" 
BEFORE INSERT ON foro.posts
FOR EACH ROW
 WHEN (NEW.id IS NULL) BEGIN
  :new.id := foro.seq_posts.nextval;
END;

/
ALTER TRIGGER "FORO"."TRG_INS_POSTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_INS_USERS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "FORO"."TRG_INS_USERS" 
BEFORE INSERT ON foro.users
FOR EACH ROW
 WHEN (NEW.id IS NULL) BEGIN
  :new.id := foro.seq_users.nextval;
END;

/
ALTER TRIGGER "FORO"."TRG_INS_USERS" ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "FORO"."USERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FORO"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POSTS
--------------------------------------------------------

  ALTER TABLE "FORO"."POSTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FORO"."POSTS" ADD CONSTRAINT "POSTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POSTS
--------------------------------------------------------

  ALTER TABLE "FORO"."POSTS" ADD CONSTRAINT "POSTS_USERS_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "FORO"."USERS" ("ID") ENABLE;
