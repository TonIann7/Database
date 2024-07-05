CREATE OR REPLACE VIEW Vista_Corrieri_e_Consegne AS
SELECT
    C.ID_CORRIERE,
    C.NOME_CORRIERE, 
    CN.DATA_CONSEGNA,
    CN.MODALITA_CONSEGNA
FROM
    CORRIERE C
JOIN
    CONSEGNA CN ON C.ID_CONSEGNA = CN.ID_CONSEGNA;