CREATE OR REPLACE TRIGGER CONTROLLO_DATA_CONSEGNA
BEFORE INSERT ON CONSEGNA
FOR EACH ROW
DECLARE
    DataVendita DATE;
BEGIN
    SELECT DATA_VENDITA INTO DataVendita
    FROM ORDINE
    WHERE N_FATTURA_ORDINE = :NEW.N_FATTURA_ORDINE;
--Controlla se la data di consegna che stiamo inserendo risulta essere precedente alla data di vendita del prodotto
    IF (:NEW.DATA_CONSEGNA <= DataVendita) THEN
    --Se è vero , genera un errore
        RAISE_APPLICATION_ERROR(-20001, 'La data di consegna deve essere successiva alla data di vendita dell''ordine.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'N_FATTURA_ORDINE non valido.');
END;