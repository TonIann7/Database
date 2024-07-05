CREATE OR REPLACE VIEW Vista_Consegne_Per_Cliente AS
SELECT C.CF_C AS Codice_Fiscale_Cliente,
       O.N_FATTURA_ORDINE AS Numero_Fattura_Ordine,
       CO.ID_CONSEGNA AS ID_Cons,
       CO.DATA_CONSEGNA AS Data_Consegna,
       CO.MODALITA_CONSEGNA AS Modalita_Consegna
FROM CLIENTE C
LEFT JOIN ORDINE O ON C.CF_C = O.CF_C
LEFT JOIN CONSEGNA CO ON O.N_FATTURA_ORDINE = CO.N_FATTURA_ORDINE;