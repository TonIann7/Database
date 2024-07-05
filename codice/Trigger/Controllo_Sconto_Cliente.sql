CREATE OR REPLACE TRIGGER CONTROLLA_SCONTO_CLIENTE
BEFORE INSERT ON ORDINE
FOR EACH ROW
DECLARE
    NumeroOrdini NUMBER;
    ScontoApplicato NUMBER;
BEGIN
    -- Conta quanti ordini ha effettuato il cliente
    SELECT COUNT(*)
    INTO NumeroOrdini
    FROM ORDINE
    WHERE CF_C = :NEW.CF_C;

    -- Se il cliente ha effettuato 3 o più ordini, verifica lo sconto applicato
    IF NumeroOrdini >= 3 THEN
        ScontoApplicato := :NEW.SCONTO_APPLICATO;
        -- Verifica se lo sconto è inferiore al 20%
        IF ScontoApplicato < 20 THEN
        --Genera un errore
            RAISE_APPLICATION_ERROR(-20009, 'Il cliente ha diritto ad uno sconto maggiore o uguale al 20%.');
        END IF;
    END IF;
END;
