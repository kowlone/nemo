--liquibase formatted sql

--changeset Novacroft:11.0.71
CREATE TABLE ${schemaName}."SETTLEMENT"
("ID" NUMBER(38) NOT NULL CONSTRAINT "SETTLEMENT_PK" PRIMARY KEY
, "VERSION" NUMBER(38) DEFAULT 0 NOT NULL
, "CREATEDUSERID" VARCHAR2(64) NOT NULL
, "CREATEDDATETIME" DATE NOT NULL
, "MODIFIEDUSERID" VARCHAR2(64)
, "MODIFIEDDATETIME" DATE
, "CUSTOMERORDERID" NUMBER(38) NOT NULL
, "STATUS" VARCHAR2(32) NOT NULL
, "SETTLEMENTDATE" DATE NOT NULL
, "AMOUNT" NUMBER(38) NOT NULL
, "SETTLEMENTMETHOD" VARCHAR2(32) NOT NULL
, "PAYMENTCARDID" NUMBER(38)
, "TRANSACTIONTYPE" VARCHAR2(60)
, "TRANSACTIONUUID" VARCHAR2(60)
, "DECISION" VARCHAR2(7)
, "MESSAGE" VARCHAR2(255)
, "REASONCODE" VARCHAR2(5)
, "TRANSACTIONID" VARCHAR2(26)
, "AUTHORISEDAMOUNT" NUMBER(38)
, "AUTHORISATIONTIME" DATE
, "AUTHORISATIONREFERENCENUMBER" VARCHAR2(60)
, "CARDID" NUMBER(38)
, "REQUESTSEQUENCENUMBER" NUMBER(38)
, "PICKUPNATIONALLOCATIONCODE" NUMBER(38)
, "EXPIRESON" DATE
, "AUTOLOADSTATE" NUMBER(1, 0)
, "PAYEENAME" VARCHAR2(128)
, "ADDRESSID" NUMBER(38)
, "FILEEXPORTLOGID" NUMBER(38)
, "CHEQUESERIALNUMBER" NUMBER(38)
, "PRINTEDON" DATE
, "PAYMENTREFERENCE" NUMBER(38)
, "CLEAREDON" DATE
, "OUTDATEDON" DATE
, "BANKACCOUNT" VARCHAR2(20)
, "SORTCODE" VARCHAR2(20)
, "BANKPAYMENTDATE" DATE
, "PAYMENTFAILEDDATE" DATE
, "FINANCIALSERVICESREJECTCODE" VARCHAR2(1)
, "SETTLEMENTNUMBER" NUMBER(38)
, CONSTRAINT "SETTLEMENT_FK1" FOREIGN KEY ("CUSTOMERORDERID") REFERENCES ${schemaName}."CUSTOMERORDER"("ID")
, CONSTRAINT "SETTLEMENT_FK2" FOREIGN KEY ("CARDID") REFERENCES ${schemaName}."CARD"("ID")
, CONSTRAINT "SETTLEMENT_FK3" FOREIGN KEY ("ADDRESSID") REFERENCES ${schemaName}."ADDRESS"("ID")
)
TABLESPACE ${tableTablespace}
;

CREATE INDEX ${schemaName}."SETTLEMENT_IDX1"
ON ${schemaName}."SETTLEMENT"
("CUSTOMERORDERID")
TABLESPACE ${indexTablespace}
;

CREATE INDEX ${schemaName}."SETTLEMENT_IDX2"
ON ${schemaName}."SETTLEMENT"
("REQUESTSEQUENCENUMBER")
TABLESPACE ${indexTablespace}
;

CREATE INDEX ${schemaName}."SETTLEMENT_IDX3"
ON ${schemaName}."SETTLEMENT"
("CHEQUESERIALNUMBER")
TABLESPACE ${indexTablespace}
;

CREATE SEQUENCE ${schemaName}."SETTLEMENT_SEQ";

CREATE SEQUENCE ${schemaName}."ORS_SEQ";

COMMENT ON TABLE ${schemaName}."SETTLEMENT" IS 'Settlement - payment or refund against an order - refer to Hibernate configuration for sub-type mapping';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."ID" IS 'Surrogate primary key - generated from SETTLEMENT_SEQ sequence';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."VERSION" IS 'Record version for optimistic locking';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."CREATEDUSERID" IS 'Who created the record';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."CREATEDDATETIME" IS 'When (date and time) the record was created';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."MODIFIEDUSERID" IS 'Who last modified the record';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."MODIFIEDDATETIME" IS 'When (date and time) the record was last modified';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."CUSTOMERORDERID" IS 'Reference to order';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."SETTLEMENTDATE" IS 'Date and time of settlement';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."STATUS" IS 'Current status of settlement';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."AMOUNT" IS 'Value of settlement (in pence): positive for payment; and negative for refund';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."SETTLEMENTMETHOD" IS 'Discriminator for settlement sub-types, e.g. Payment Card, Web Credit, BACS, cheque, etc';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."PAYMENTCARDID" IS 'Reference to payment card';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."TRANSACTIONTYPE" IS 'CyberSource Secure Acceptance payment gateway (request) transaction type';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."TRANSACTIONUUID" IS 'CyberSource Secure Acceptance payment gateway (request) unique identifier';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."DECISION" IS 'CyberSource Secure Acceptance payment gateway (reply) result';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."MESSAGE" IS 'CyberSource Secure Acceptance payment gateway (reply) message';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."REASONCODE" IS 'CyberSource Secure Acceptance payment gateway (reply) result code';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."TRANSACTIONID" IS 'CyberSource Secure Acceptance payment gateway (reply) transaction identifier';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."AUTHORISEDAMOUNT" IS 'CyberSource Secure Acceptance payment gateway (reply) authorised amount';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."AUTHORISATIONTIME" IS 'CyberSource Secure Acceptance payment gateway (reply) authorisation date and time';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."AUTHORISATIONREFERENCENUMBER" IS 'CyberSource Secure Acceptance payment gateway (reply) authorisation transaction reference number';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."CARDID" IS 'Reference to oyster card';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."REQUESTSEQUENCENUMBER" IS 'CUBIC request reference number';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."PICKUPNATIONALLOCATIONCODE" IS 'ID of location where settlement can be picked up';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."EXPIRESON" IS 'Last date that the settlement can be picked up';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."AUTOLOADSTATE" IS 'Auto load (auto top up) state';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."PAYEENAME" IS 'Name of payee';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."ADDRESSID" IS 'Reference to address';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."FILEEXPORTLOGID" IS 'Reference to file export log';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."CHEQUESERIALNUMBER" IS 'Serial number of cheque produced';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."PRINTEDON" IS 'When cheque was produced';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."PAYMENTREFERENCE" IS 'Financial Services Centre (FSC) payment reference';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."CLEAREDON" IS 'When cheque was cleared';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."OUTDATEDON" IS 'When cheque was outdated';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."BANKACCOUNT" IS 'Account for BACS Payment';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."SORTCODE" IS 'Sort Code for BACS Payment';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."BANKPAYMENTDATE" IS 'Bacs Bank Payment Date';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."PAYMENTFAILEDDATE" IS 'Bacs Payment Failed Date';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."FINANCIALSERVICESREJECTCODE" IS 'Reject code for Failed Bacs Payment';
COMMENT ON COLUMN ${schemaName}."SETTLEMENT"."SETTLEMENTNUMBER" IS 'Generated number for ORS reference a sequence';

CREATE TABLE ${schemaName}."SETTLEMENT_AUD"
("REV" NUMBER NOT NULL
, "REVTYPE" NUMBER NOT NULL
,"ID" NUMBER(38) NOT NULL
, "VERSION" NUMBER(38)
, "CREATEDUSERID" VARCHAR2(64)
, "CREATEDDATETIME" DATE
, "MODIFIEDUSERID" VARCHAR2(64)
, "MODIFIEDDATETIME" DATE
, "CUSTOMERORDERID" NUMBER(38)
, "STATUS" VARCHAR2(32)
, "SETTLEMENTDATE" DATE
, "AMOUNT" NUMBER(38)
, "SETTLEMENTMETHOD" VARCHAR2(32)
, "PAYMENTCARDID" NUMBER(38)
, "TRANSACTIONTYPE" VARCHAR2(60)
, "TRANSACTIONUUID" VARCHAR2(60)
, "DECISION" VARCHAR2(7)
, "MESSAGE" VARCHAR2(255)
, "REASONCODE" VARCHAR2(5)
, "TRANSACTIONID" VARCHAR2(5)
, "AUTHORISEDAMOUNT" NUMBER(38)
, "AUTHORISATIONTIME" DATE
, "AUTHORISATIONREFERENCENUMBER" VARCHAR2(60)
, "CARDID" NUMBER(38)
, "REQUESTSEQUENCENUMBER" NUMBER(38)
, "PICKUPNATIONALLOCATIONCODE" NUMBER(38)
, "EXPIRESON" DATE
, "AUTOLOADSTATE" NUMBER(1, 0)
, "PAYEENAME" VARCHAR2(128)
, "ADDRESSID" NUMBER(38)
, "FILEEXPORTLOGID" NUMBER(38)
, "CHEQUESERIALNUMBER" NUMBER(38)
, "PRINTEDON" DATE
, "PAYMENTREFERENCE" NUMBER(38)
, "CLEAREDON" DATE
, "OUTDATEDON" DATE
, "BANKACCOUNT" VARCHAR2(20)
, "SORTCODE" VARCHAR2(20)
, "BANKPAYMENTDATE" DATE
, "PAYMENTFAILEDDATE" DATE
, "FINANCIALSERVICESREJECTCODE" VARCHAR2(1)
, "SETTLEMENTNUMBER" NUMBER(38)
)
TABLESPACE ${tableTablespace}
;

COMMENT ON TABLE ${schemaName}."SETTLEMENT_AUD" IS 'Audit records for SETTLEMENT table';
