--liquibase formatted sql

--changeset Novacroft:11.0.126
INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(1, 'Installer', SYSDATE, NULL, NULL, 'Lost Card');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(2, 'Installer', SYSDATE, NULL, NULL, 'Stolen Card');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(3, 'Installer', SYSDATE, NULL, NULL,'LUL Revenue Request');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(4, 'Installer', SYSDATE, NULL, NULL,'LBSL Revenue Request');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(5, 'Installer', SYSDATE, NULL, NULL,'NR/DLR/CTL Revenue Request');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(6, 'Installer', SYSDATE, NULL, NULL,'London Borough Request');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(7, 'Installer', SYSDATE, NULL, NULL,'Revenue Investigation');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(8, 'Installer', SYSDATE, NULL, NULL,'LUL Payment Query');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(9, 'Installer', SYSDATE, NULL, NULL,'LUL Payment Irregularity');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(10, 'Installer', SYSDATE, NULL, NULL,'Off System Payment Irregularity');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(11, 'Installer', SYSDATE, NULL, NULL,'TIC Payment Irregularity');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(12, 'Installer', SYSDATE, NULL, NULL,'NR Payment Irregularity');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(13, 'Installer', SYSDATE, NULL, NULL,'Other Payment Irregularity');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(14, 'Installer', SYSDATE, NULL, NULL,'OTR Replacement Irregularity');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(15, 'Installer', SYSDATE, NULL, NULL,'Surrendered Cards');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(16, 'Installer', SYSDATE, NULL, NULL,'Incorrect Detail');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(17, 'Installer', SYSDATE, NULL, NULL,'Spare');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(18, 'Installer', SYSDATE, NULL, NULL,'Failed');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(19, 'Installer', SYSDATE, NULL, NULL,'Special Exercise');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(20, 'Installer', SYSDATE, NULL, NULL,'No Longer Eligible');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(21, 'Installer', SYSDATE, NULL, NULL,'Freedom Pass - No Longer Eligible');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(22, 'Installer', SYSDATE, NULL, NULL,'Spare');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(23, 'Installer', SYSDATE, NULL, NULL,'Spare');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(24, 'Installer', SYSDATE, NULL, NULL,'Transaction Error');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(25, 'Installer', SYSDATE, NULL, NULL,'Batch Stolen');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(26, 'Installer', SYSDATE, NULL, NULL,'Batch Recall - Faulty');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(27, 'Installer', SYSDATE, NULL, NULL,'Batch Recall - Fraud Risk');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(28, 'Installer', SYSDATE, NULL, NULL,'Spare');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(29, 'Installer', SYSDATE, NULL, NULL,'Stolen Card Reader');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(30, 'Installer', SYSDATE, NULL, NULL,'Spare');

INSERT INTO ${schemaName}.HOTLISTREASON ( "ID", "CREATEDUSERID", "CREATEDDATETIME", "MODIFIEDUSERID", "MODIFIEDDATETIME",  "DESCRIPTION") VALUES
(31, 'Installer', SYSDATE, NULL, NULL,'Multiple Hotlisting Reasons');