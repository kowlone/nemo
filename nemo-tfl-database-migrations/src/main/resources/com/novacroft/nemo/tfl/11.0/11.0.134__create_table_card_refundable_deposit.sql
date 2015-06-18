--liquibase formatted sql

--changeset Novacroft:11.0.134
CREATE TABLE ${schemaName}."CARDREFUNDABLEDEPOSIT"
("ID" NUMBER(38) NOT NULL CONSTRAINT "CARDREFUNDABLEDEPOSIT_PK" PRIMARY KEY
, "CREATEDUSERID" VARCHAR2(64) NOT NULL
, "CREATEDDATETIME" DATE NOT NULL
, "MODIFIEDUSERID" VARCHAR2(64)
, "MODIFIEDDATETIME" DATE
, "PRICE" NUMBER(9, 2) NOT NULL
, "STARTDATE" DATE NOT NULL
, "ENDDATE" DATE
, CONSTRAINT "CARDREFUNDABLEDEPOSIT_UK1" UNIQUE ("PRICE")
)
TABLESPACE ${tableTablespace}
;

CREATE SEQUENCE ${schemaName}.CARDREFUNDABLEDEPOSIT_SEQ START WITH 1 INCREMENT BY 1 NOMAXVALUE;

COMMENT ON TABLE ${schemaName}.CARDREFUNDABLEDEPOSIT IS 'Initial card purchase refundable deposit amount';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."ID" IS 'Surrogate primary key - generated from CARDREFUNDABLEDEPOSIT_SEQ sequence';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."CREATEDUSERID" IS 'Who created the record';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."CREATEDDATETIME" IS 'When (date and time) the record was created';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."MODIFIEDUSERID" IS 'Who last modified the record';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."MODIFIEDDATETIME" IS 'When (date and time) the record was last modified';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."PRICE" IS 'Refundable amount';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."STARTDATE" IS 'start date of the refundable amount';
COMMENT ON COLUMN ${schemaName}.CARDREFUNDABLEDEPOSIT."ENDDATE" IS 'Refundable amount expiry date';

ALTER TABLE ${schemaName}.ITEM ADD CONSTRAINT "ITEM_FK9" FOREIGN KEY ("CARDREFUNDABLEDEPOSITID") REFERENCES ${schemaName}."CARDREFUNDABLEDEPOSIT"("ID")
