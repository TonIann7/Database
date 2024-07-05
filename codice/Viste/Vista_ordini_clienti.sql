CREATE OR REPLACE VIEW Vista_Ordini_Per_Cliente AS
SELECT C.CF_C AS Codice_Fiscale_Cliente,
       C.NOME_C AS Nome_Cliente,
       C.COGNOME_C AS Cognome_Cliente,
       O.N_FATTURA_ORDINE AS Numero_Ordine,
       O.DATA_VENDITA AS Data_Ordine,
       O.TOT_ORDINE AS Importo_Totale
FROM CLIENTE C
JOIN ORDINE O ON C.CF_C = O.CF_C;