CREATE OR REPLACE TRIGGER CONTROLLA_GARANZIA_PRODOTTI
BEFORE INSERT ON PRODOTTO_INDUSTRIALE
FOR EACH ROW
DECLARE
    TipologiaProdotto VARCHAR2(50);
BEGIN
    SELECT TIPOLOGIA_PRODOTTO
    INTO TipologiaProdotto
    FROM FORNITURA_INDUSTRIALE
    WHERE NUMERO_FATTURA_FORNITURA = :NEW.NUMERO_FATTURA_FORNITURA;

    -- Verifica se il prodotto rientra nelle tipologie specificate
    IF (TipologiaProdotto IN ('SPRAY PULIZIA OCCHIALI','PANNO MICROFIBRA','CUSTODIA OCCHIALI')) THEN
        -- Verifica se la garanzia è inferiore a 60 mesi
        IF :NEW.GARANZIA < 60 THEN
        --Se è vero , genera un errore
            RAISE_APPLICATION_ERROR(-20006, 'La garanzia deve essere maggiore o uguale a 60 mesi per questi prodotti.');
        END IF;
    END IF;
END;
